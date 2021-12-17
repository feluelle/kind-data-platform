from airflow.decorators import dag
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from airflow.providers.airbyte.sensors.airbyte import AirbyteJobSensor
from airflow.utils.dates import days_ago


@dag(start_date=days_ago(1), schedule_interval=None)
def airbyte():
    async_source_destination = AirbyteTriggerSyncOperator(
        task_id="airbyte_trigger_async",
        connection_id="{{ var.value.AIRBYTE_CONNECTION_ID }}",
        asynchronous=True,
    )
    AirbyteJobSensor(
        task_id="airbyte_job_sensor",
        airbyte_job_id=async_source_destination.output,
    )


dag = airbyte()
