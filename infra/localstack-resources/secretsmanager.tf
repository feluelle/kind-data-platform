resource "aws_secretsmanager_secret" "airflow_connection_airbyte" {
  name = "airflow/connections/airbyte_default"
}

resource "aws_secretsmanager_secret_version" "airflow_connection_airbyte" {
  secret_id     = aws_secretsmanager_secret.airflow_connection_airbyte.id
  secret_string = "http://:@host.docker.internal:8001/?"
}
