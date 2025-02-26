terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.20.0"
    }
  }
}

provider "google" {
  access_token = var.google_access_token
  project      = var.gcs_project
  region       = var.gcs_region
}

resource "google_storage_bucket" "demo-bucket" {
  name          = var.gcs_bucket_name
  location      = var.gcs_location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_id
  location   = var.gcs_location
}

resource "google_compute_address" "static_ip" {
  name   = "${var.vm_name}-static-ip"
  region = var.gcs_location
}

resource "google_compute_instance" "demo_instance" {
  boot_disk {
    auto_delete = true
    device_name = var.vm_name

    initialize_params {
      image = var.vm_image
      size  = 25
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = var.vm_size
  name         = var.vm_name

  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
}

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email = "224168512708-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"]
  }

  zone = var.gcs_zone
}
