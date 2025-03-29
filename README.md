# 🛠️ Seting up a VM and Docker Containers for DE Zoomcamp course

**_In process..._**
<em>
 TODO:
* review git ignore
* push examples of missing git ignore files with comments
* terraform/terraform_install_docker.bash - fixate versions
* add links to Zoomcamp repo with tutorials
* add commands (or better bash files with comments???)
* add descriptions of ports and how to create a tunnel
* add descriptions of containers
* add comments about stable IP
  
* add anchors and links
* formatting
</em>

## 📚 Table of Contents
<!-- GitHub-style manual TOC -->
- [Before starting](#before-starting)
- [What if I don’t want to use Google Cloud?](#what-if-i-dont-want-to-use-google-cloud_)
- [How to create a VM in Google Cloud?](#how-to-create-a-vm-in-google-cloud_)
- [How to set up GCP OS Login?](#how-to-set-up-gcp-os-login-optional-but-recommended_)
- [How to build and run containers?](#how-to-build-and-run-containers_)

> 📝 Check <mark >de-zoomcamp-infrastracture/docker/README.md</mark> for containers descriptions and SSH tunneling how-to.

## 🚦 Before starting

You should already have:

- An **active Google Cloud account**
- A **configured SSH connection** to your GCP project with permissions to create instances _(TODO: specify exact IAM roles late)_
- **Terraform installed** on your local machine

> If you're missing any of this, check the official [Zoomcamp repo](#) _(TODO: add link)_


### ❓ What if I don`t want to use Google Cloud? 

You can still follow along, but will need to adjust things manually:

- Configure a VM on another cloud manually.  
  For compatibility check the same VM image shown in <mark>terraform/terraform_gcs/variables.tf</mark> aind matching images via [Ubuntu Cloud Image Finder](https://cloud-images.ubuntu.com/locator/)

- Or run everything on any othe imade and _deal with the consequences_   
  (Check docker version used in `<mark>terraform/terraform_install_docker.bash</mark>`)


## 🛠️ How to create a VM in Goodle Cloud?

1. Copy this repository to your machine with a configured SSH connection to your Google Cloud
2. Change keys files in <mark >de-zoomcamp-infrastracture/terraform/terraform_gcs/keys/</mark> (in this folder you can see an _example_ of how these files look).
   
   > :warning: DO NOT PUSH YOUR ACTUAL KAYS TO YOUR GIT REPO
2. Apply it in <mark >de-zoomcamp-infrastracture/terraform/terraform_gcs/</mark> to create a VM

   ````bash
   terraform init
   terraform apply
   ````


  
## 🔐 How to set up GCP OS Login? (optional, but recommended)

OS Login allows secure, reusable SSH access without rotating temporary keys.
1. Create SSH key on your local machine (locally, e.g., in WSL)
   ````bash
   ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "your_email@example.com"
   ssh-keygen -f ~/.ssh/known_hosts -R "YOUR_VM_IP"
   ````

2. Enabled OS Login in Google Cloud Console
  Via GCP UI go to Compute Engine → Metadata -> add Custom metadata
     Key: enable-oslogin
     Value: TRUE
2. Upload public key to OS Login:
    1. Go to OS Login SSH Keys page
    2. Paste contents of id_ed25519.pub
    3. Save


   >  :memo: This will create a new user named by your email with all special symbols replaced by _ (for example, your_email_gmail_com)

 4. (Optional) Fix access to old folders
    If you're trying to access files created under a previous user:
    
    ````bash
    sudo chown -R $USER:YOUR_OLD_USER_NAME /home/YOUR_OLD_USER_NAME
    ``````
   
### Some optional steps for different situations


#### 🔐 If you want to have full sudo access to your new user

1. In GCP UI go IAM & Admin → IAM
2. Find your email
2. Assign role: Compute OS Admin Login (grants sudo rights via OS Login)

    
#### 💻 If you work from WSL, but want to use VS Code or another IDE

1. In WSL:

       cp ~/.ssh/id_ed25519* /mnt/c/Users/YOUR_WINDOWS_USER/.ssh/
2. In PowerShell:
  
       icacls "C:\Users\YOUR_WINDOWS_USER\.ssh\id_ed25519" /inheritance:r /grant:r "%USERNAME%:R"
       (Get-Content "$env:USERPROFILE\.ssh\known_hosts") -notmatch "YOUR\.IP\.WITH\.BACKSLASHES" | Set-Content "$env:USERPROFILE\.ssh\known_hosts"

      
#### 🔁 If you want to create a VM name alias for easier use

  Add in ~/.ssh/config
  
      Host YOUR_VM_ALIAS
        HostName YOUR_VM_PUBLUC_IP
        User YOUR_OS_LOGIN_USER
        IdentityFile ~/.ssh/id_ed25519

        
#### 🐳 If you want to use Docker without sudo

  On your GCP VM:

      sudo usermod -aG docker $USER
      newgrp docker  # or logout/login
  


## 🧱 How to build and run containers?

1. Install Docker and Docker-Compose via <mark >de-zoomcamp-infrastracture/terraform/terraform_install_docker.bash</mark>
2. In <mark >de-zoomcamp-infrastracture/docker/</mark> run
   
       sudo docker compose build
       sudo docker compose up
   
> 📝 Check <mark >de-zoomcamp-infrastracture/docker/README.md</mark> for containers descriptions and SSH tunneling how-to.

