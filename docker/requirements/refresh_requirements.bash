#!/bin/bash

docker build . -t tmp-gen-airflow-req
docker create --name tmp-gen-airflow-req tmp-gen-airflow-req
docker cp tmp-gen-airflow-req:/opt/airflow/requirements-python.txt ./requirements-python.txt
echo "Requirements file is succesfully generated"

docker rm tmp-gen-airflow-req
docker image rm tmp-gen-airflow-req
echo "Temporal container and image are deleted"