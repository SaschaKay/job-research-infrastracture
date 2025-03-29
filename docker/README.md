_**Page in process...**_
**TODO:**
- add in Terraform 

      sudo chown -R 50000:0 /opt/docker/airflow

- Short cheat shit for Notebooks

      docker exec -it <jupyter_container_name> jupyter notebook list # shows the running notebooks and their port numbers
                                                                     # (for instance: 8080)
    jupyter notebook stop 8889 
                          
- Short cheat shit for cleaning ports

      lsof -n -i4TCP:[port-number] # shows PID.
      kill -9 [PID] # kill the process.



## 🐳 Project Containers Overview

| Container       | Purpose                                                       | Ports                  | 
|-----------------|---------------------------------------------------------------|------------------------|
| `jupyter`       | Jupyter Lab environment for development and experimentation   | 8888, 8889, 5000       | 
| `postgres`      | PostgreSQL database instance for metadata and storage         | 5432                   |
| `pgadmin`       | Web UI for managing PostgreSQL                                | 5055 (mapped to port 80) | 
| `init-airflow`  | One-time Airflow setup: DB migration, user creation           | —                      |
| `scheduler`     | Airflow scheduler service                                     | —                      | 
| `webserver`     | Airflow web UI                                                | 8080                   | 

## 🗂️ Docker Volumes

These named volumes persist data between container restarts and are used for sharing information across services.

| Volume Name           | Used By           | Purpose                                                                 |
|-----------------------|------------------|-------------------------------------------------------------------------|
| `postgres_data`       | `postgres`        | Stores PostgreSQL database files (`/var/lib/postgresql/data`)          |
| `pgadmin_data`        | `pgadmin`         | Stores pgAdmin configuration and session data (`/var/lib/pgadmin`)     |
| `jupyter_data`        | `jupyter`         | Stores Jupyter notebooks and outputs (`/home/jovyan/work`)             |
| `airflow_shared_data` | `init-airflow`, `scheduler`, `webserver` | Shared initialization status and configuration between Airflow services (`/opt/airflow/shared`) |


## 🌐 Exposed Ports

Ports mapped from containers to the host system to enable access to web interfaces and services.

| Host Port | Container     | Internal Port | Description                             |
|-----------|---------------|---------------|-----------------------------------------|
| `8888`    | `jupyter`     | `8888`        | JupyterLab main interface               |
| `8889`    | `jupyter`     | `8889`        | Second Jupyter instance port            |
| `5000`    | `jupyter`     | `5000`        | Custom dev port (e.g., Flask app)       |
| `5432`    | `postgres`    | `5432`        | PostgreSQL access                       |
| `5055`    | `pgadmin`     | `80`          | pgAdmin web UI                          |
| `8080`    | `webserver`   | `8080`        | Airflow web UI                          |

### Accessing Container Ports via SSH Tunnels

Some IDEs create tunnels automatically. If you use VS Code with the Remote - SSH extension, it will notify you about available ports after you run docker compose up.

To securely access services running on your VM, create an SSH tunnel from your local machine:

If you need to create tunnel by hand, run

```bash
ssh -N -L LOCAL_PORT:localhost:HOST_PORT your_user@your_vm_ip
```

Where LOCAL_PORT you choose by yourself(usually the same as HOST_PORT).
After running the command, open http://localhost:LOCAL_PORT in your browser.

