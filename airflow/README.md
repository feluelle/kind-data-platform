# Airflow

## Deployment

You can deploy changes to the airflow image by running the following command:

```bash
task -t airflow/Taskfile.yml
```

_You can optionally tag the image with a version via `TAG=<version>`._

## Airbyte DAG

```bash
# Create an alias for accessing your localstack aws environment
alias aws-local "aws --endpoint-url=http://0.0.0.0:4566"
# Specify the id of the Airbyte connection you want to trigger
aws-local secretsmanager create-secret --name airflow/variables/AIRBYTE_CONNECTION_ID --secret-string "bb50c78f-002e-4b2e-9852-864cca12ad49"
```
