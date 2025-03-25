!!! Do not change file requirements-python.txt manually !!!

File requirements-python.txt contains list of lybriries with versions (with dependencies) included in Jupyter and Airflow worker container's images. It based on:
* required Python lybraries from requirements-python.in 
* Airflow constraints from constraints-airflow.txt
requirements-python.txt is generated automatically to garantee comparability with current Airflow version.

To add new libraries to Jupyter and Airflow worker container's images 
1. Add libraries in requirements-python.in
2. Run
    bash refresh_dependencies.bash
It will create temporaly containrer and generate 

To update requirements for a new Airflow version 
1. Change image tag in Dockerfile
2. Update constraints-airflow.txt
    fetch https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt >> constraints-airflow.txt
3. Run
    bash refresh_dependencies.bash



