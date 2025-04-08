variable "environment" {
  default = "prod"
}

variable "gcs_region" {
  default = "EU"
}

variable "gcs_location" {
  description = "Google Cloud Storage Bucket Location"
  default     = "europe-west1"
}

variable "gcs_zone" {
  description = "Google Compute Instance Zone"
  default     = "europe-west1-d"
}

variable "vm_size" {
  description = "Google Compute Instance Machine Type"
  default     = "e2-medium"
}

variable "vm_name" {
  description = "Compute Instance Device Name"
  default     = "instance-jobs-research-prod"
}

variable "docker_sourse" {
  default = "kreuzwerker/docker" 
}

variable "docker_version" {
  default = "~> 3.0.1"
}

# GCS

variable "google_access_token" {
  default = ""
}

variable "gcs_project" {
  description = "Google Cloud Project ID"
  default     = "x-avenue-450615-c3"
}

variable "vm_image" {
  description = "Google Cloud Compute Instance Device Image"
  default     = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20250213"
}

variable "bq_dataset_id" {
  description = "BigQuery Dataset ID"
  default     = "jobs_postings"
}

variable "gcs_bucket_name" {
  description = "Storage Bucket Name"
  default     = "jobs-postings-bucket-prod"
}



