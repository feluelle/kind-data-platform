FROM apache/airflow:2.2.4

RUN pip install --no-cache-dir apache-airflow-providers-airbyte==2.1.1

WORKDIR ${AIRFLOW_HOME}
COPY . .
