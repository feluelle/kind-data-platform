resource "aws_secretsmanager_secret" "airflow_connection_aws" {
  name = "airflow/connections/aws_default"
}

resource "aws_secretsmanager_secret_version" "airflow_connection_aws" {
  secret_id     = aws_secretsmanager_secret.airflow_connection_aws.id
  secret_string = "aws://mock_access_key:mock_secret_key@:/?host=http%3A%2F%2Fhost.docker.internal%3A4566"
}

resource "aws_secretsmanager_secret" "airflow_connection_airbyte" {
  name = "airflow/connections/airbyte_default"
}

resource "aws_secretsmanager_secret_version" "airflow_connection_airbyte" {
  secret_id     = aws_secretsmanager_secret.airflow_connection_airbyte.id
  secret_string = "http://:@host.docker.internal:8001/?"
}
