# Airflow

## Deployment

You can deploy changes to the airflow image by running the following command:

```bash
task -t airflow/Taskfile.yml
```

_You can optionally tag the image with a version via `TAG=<version>`._

## Airbyte DAG

1. [Add a Source](https://docs.airbyte.com/quickstart/add-a-source)
2. [Add a Destination](https://docs.airbyte.com/quickstart/add-a-destination)
3. [Set up a Connection](https://docs.airbyte.com/quickstart/set-up-a-connection/)
4. Copy the connection id and paste it in the following `<connection-id>`

```bash
# Create an alias for accessing your localstack aws environment
alias aws-local "aws --endpoint-url=http://0.0.0.0:4566"
# Specify the id of the Airbyte connection you want to trigger
aws-local secretsmanager create-secret --name airflow/variables/AIRBYTE_CONNECTION_ID --secret-string "<connection-id>"
```
