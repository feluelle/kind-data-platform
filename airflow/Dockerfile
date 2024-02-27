FROM apache/airflow:2.8.2-python3.10

RUN pip install --no-cache-dir apache-airflow-providers-airbyte==2.1.4

WORKDIR ${AIRFLOW_HOME}
COPY . .
