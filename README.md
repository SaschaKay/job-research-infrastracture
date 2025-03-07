* Apply Terraform 
* Install docker==27.5.1 and docker-compose==v2.32.4-desktop.1 on the cloud VM
* Pull this repository
* In ./docker/ run
        docker compose build
        docker compose up
* If you don't have a database yet run
        docker exec airflow_webserver airflow db init
        docker-compose restart airflow_webserver 
        docker exec airflow_scheduler airflow db init
        docker-compose restart airflow_scheduler 
