# Seting up a VM and Docker Containers for DE Zoomcamp course

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



## Before starting

You should already have:
* active Google Cloud account
* configured SSH connection to your Google Cloud account with permissions to create instances **_specify permissions_**
* installed Terraform library on your local machine
If you're missing any of this, check **_add link to zoomcamp repo_**


#### What if I don`t want to use Google Cloud? 

Using Terraform configuration for GC from this repo guarantees that the rest of the code will work without any adjustments. But if you don't want to use it, you have several alternatives: 
- Configure a VM in any other cloud yourself. For better comparability, check vm_image in <mark >terraform/terraform_gcs/variables.tf</mark> and use 
<a href="https://cloud-images.ubuntu.com/locator/" target="_blank">Ubuntu Cloud Image Finder</a> to find the image with the same Ubuntu environment for your cloud.
- Miss this step and use any of your existing machines and _deal with the consequences_. You can check Docker and Docker Compose versions in <mark >terraform/terraform_install_docker.bash</mark>.



## How to create a VM in GS?

1. Copy this repository to your machine with a configured SSH connection to your Google Cloud
2. Change keys files in <mark >de-zoomcamp-infrastracture/terraform/terraform_gcs/keys/</mark> (in this folder you can see an _example_ of how these files look).
   
   > :warning: DO NOT PUSH YOUR ACTUAL KAYS TO YOUR GIT REPO
2. Apply it in <mark >de-zoomcamp-infrastracture/terraform/terraform_gcs/</mark> to create a VM

       _(specify commands later)_



  
## How to set up GCP OS Login? (optional)

OS Login allows you to connect to your VM without rotating temporary SSH keys.
1. Create SSH key on your local machine (for example, WSL)

       ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -C "YOUR_EMAIL"
       ssh-keygen -f ~/.ssh/known_hosts -R "YOUR_VM_IP"

2. Enabled OS Login in Google Cloud Console
  Via UI:
  Go to Metadata (project level) -> add custom metadata
     Key: enable-oslogin
     Value: TRUE
2. Upload public key to OS Login:
    1. Go to OS Login SSH Keys page
    2. Paste contents of id_ed25519.pub
    3. Save

 >  :memo: This will create a new user named by your email with all special symbols replaced by _ (for example, your_email_gmail_com)



### Futher optional steps


#### If you want to have full sudo access to your new user

1. In GCP UI go ==IAM & Admin → IAM==
2. Find your email
2. Assign role: Compute OS Admin Login (grants sudo rights via OS Login)

    
#### If you work from WSL, but want to use VS Code or another IDE

1. WSL:

       cp ~/.ssh/id_ed25519* /mnt/c/Users/YOUR_WINDOWS_USER/.ssh/
2. PowerShell:
  
       icacls "C:\Users\YOUR_WINDOWS_USER\.ssh\id_ed25519" /inheritance:r /grant:r "%USERNAME%:R"
       (Get-Content "$env:USERPROFILE\.ssh\known_hosts") -notmatch "YOUR\.IP\.WITH\.BACKSLASHES" | Set-Content "$env:USERPROFILE\.ssh\known_hosts"

      
#### If you want to create a VM name alias for easier use

  Add in ~/.ssh/config
  
      Host YOUR_VM_DESIERED_NAME
        HostName YOUR_VM_PUBLUC_IP
        User YOUR_OS_LOGIN_USER
        IdentityFile ~/.ssh/id_ed25519

        
#### If you want to use Docker without sudo

  On your GCP VM:

      sudo usermod -aG docker $USER
      newgrp docker  # or logout/login
  



## How to create containers?

1. Install Docker and Docker-Compose with  <mark >de-zoomcamp-infrastracture/terraform/terraform_install_docker.bash</mark>
2. In <mark >de-zoomcamp-infrastracture/docker/</mark> run
   
       sudo docker compose build
       sudo docker compose up


  
