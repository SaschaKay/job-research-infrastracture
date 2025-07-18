> [!CAUTION]
>  🙏DO NOT CHANGE FILE requirements-python.txt MANUALLY🙏

File requirements-python.txt contains a list of libraries with versions (with dependencies) included in Jupyter and Airflow worker containers' images. It is based on:
* required Python libraries from requirements-python.in 
* Airflow constraints from constraints-airflow.txt
requirements-python.txt is generated automatically to guarantee comparability with the current Airflow version.

### To add new libraries:
_(to the Jupyter and Airflow worker containers' images)_
1. Add libraries in requirements-python.in
2. Run

         bash refresh_requirements.bash
   It will create a temporary container to generate a requirements file and test dependencies.

### To update requirements for a new Airflow version 
1. Change the image tag in the Dockerfile.
2. Update constraints-airflow.txt with the command:
   
         fetch https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt >> constraints-airflow.txt
4. Run

         bash refresh_requirements.bash 
