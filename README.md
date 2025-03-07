* Apply Terraform 
* On VM:
    **clone this repository
    **install Docker and Docker-Compose
        bash ./de-zoomcamp-infrastracture/terraform/terraform_install_docker.bash
* In ./de-zoomcamp-infrastracture/docker/ run
        docker compose build
        docker compose up
* If you don't have a database yet run
        docker exec airflow_webserver airflow db init
        docker-compose restart airflow_webserver 
        docker exec airflow_scheduler airflow db init
        docker-compose restart airflow_scheduler 
