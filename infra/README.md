# infra

This folder contains all the infrastructure needed for setting up the data platform.

![infra image](graph.svg)

## localstack-services

I am using the following localstack services:

![localstack-services image](localstack-services/graph.svg)

### s3

I am using [S3](https://aws.amazon.com/s3/) to **store data**.

### secretsmanager

I am using [Secrets Manager](https://aws.amazon.com/secrets-manager/) to **store secrets**.

## airbyte

I am using [Airbyte](https://airbyte.io) to **extract and load** data to the postgres database.

## airflow

I am using [Airflow](https://airflow.apache.org) to **orchestrate** ETL jobs.

## dbt

I am using [dbt](https://www.getdbt.com) to transform data within the postgres database.

To retrieve the password for the postgresql user `postgres`, run the following:
```bash
kubectl get secret --namespace dbt postgresql -o jsonpath="{.data.postgresql-password}" | base64 --decode ; echo
```

## grafana

I am using [Grafana](https://grafana.com) to **monitor** all services.

To retrieve the password for the grafana user `admin`, run the following:
```bash
kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

## localstack

I am using [localstack](https://localstack.cloud) to create a **local stack of AWS resoures**.

## prometheus

I am using [Prometheus](https://prometheus.io) to scrape **metrics** of all services.

## superset

I am using [Superset](https://superset.apache.org) to **visualise** data.
