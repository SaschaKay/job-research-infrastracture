**_In process..._**
<em>
 TODO:
* review git ignore
* push excamples of missing git ignore files with comments
* terraform/terraform_install_docker.bash - fixate versions
* add links to zoomcamp repo with tutorials
* add commands (or better bash files with comments???)
* add descriptions of ports and how to create tunnel
* add descriptions of containers
* add anchors and links
* formatting
</em>

## Before starting
you should already have:
* active Google Cloud account
* configured SSH connection to your Google Cloud account with permissions to create instances **_specify permissions_**
* installed Terraform library on your machine with connection
If you're missing any of this, check **_add link to zoomcamp repo_**


## What if I don`t want to use Google Cloud? 
Usin Terraform configuration for GC from this repo to guarantees that the rest of the code will work without any adjustments. But if you don't want to use it, you have several alternatives: 
   * Configurate a VM in any other cloud yourself. For better comparability, check vm_image in terraform/terraform_gcs/variables.tf and use https://cloud-images.ubuntu.com/locator/ to find the image with the same Ubuntu environment for your cloud.
   * Miss this step and use any of your existing machines. Use the same Docker and Docker Compose versions (check terraform/terraform_install_docker.bash).

## How to create a VM in GS?
* Copy this repository on your machine with configured SSH connection to your Google Cloud
* Change keys files in de-zoomcamp-infrastracture/terraform/terraform_gcs/keys/ (in this folder you can see an _example_ of how these files look).
!!!DO NOT PUSH YOUR ACTUAL KAYS TO YOUR GIT REPO!!!
* Apply it in de-zoomcamp-infrastracture/terraform/terraform_gcs/ to create a VM _(specify later)_

## How to create containers on your host machine?
* install Docker and Docker-Compose with
  bash ./de-zoomcamp-infrastracture/terraform/terraform_install_docker.bash
* In ./de-zoomcamp-infrastracture/docker/ run
        docker compose build
        docker compose up
  
  

