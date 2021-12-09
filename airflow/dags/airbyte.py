from airflow.decorators import dag
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from airflow.providers.airbyte.sensors.airbyte import AirbyteJobSensor
from airflow.utils.dates import days_ago


@dag(start_date=days_ago(1), schedule_interval=None)
def airbyte():
    async_source_destination = AirbyteTriggerSyncOperator(
        task_id="airbyte_async_github_to_postgres",
        connection_id="{{ var.value.AIRBYTE_GITHUB_TO_POSTGRES_CONNECTION_ID }}",
        asynchronous=True,
    )
    AirbyteJobSensor(
        task_id="airbyte_sensor_github_to_postgres",
        airbyte_job_id=async_source_destination.output,
    )


dag = airbyte()
