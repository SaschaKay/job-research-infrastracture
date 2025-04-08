# Remove old docker packages if installed
sudo apt-get remove -y docker docker.io containerd runc

# Install required dependencies
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# Add the official Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the official Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker CE (Community Edition)
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to Docker group (optional, so you don't need sudo)
sudo usermod -aG docker $USER
newgrp docker

# Test installation
docker --version #Docker version 28.0.1, build 068a01e
docker compose version #Docker Compose version v2.33.1

#will be needed later for Airflow initialisation
sudo mkdir -p /opt/docker/airflow/{dags,logs,google}
sudo chown -R 50000:0 /opt/docker/airflow #50000 is an airflow user