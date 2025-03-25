FROM apache/airflow:2.9.3-python3.11

ENV AIRFLOW_HOME=/opt/airflow

WORKDIR $AIRFLOW_HOME

COPY requirements-airflow.txt requirements-python.in ./

RUN pip install pip-tools && \
    pip-compile ./requirements-python.in && \
    pip install -r ./requirements-python.txt 
    
