from diagrams import Diagram
from diagrams.aws.security import SecretsManager
from diagrams.aws.storage import S3
from diagrams.custom import Custom
from diagrams.onprem.analytics import Dbt, Superset
from diagrams.onprem.database import Postgresql
from diagrams.onprem.monitoring import Grafana, Prometheus
from diagrams.onprem.workflow import Airflow

with Diagram(name="kind-data-platform", show=False):
    airbyte = Custom("Airbyte", "./custom/airbyte/airbyte.png")
    airflow = Airflow()
    dbt = Dbt()
    postgresql = Postgresql()
    grafana = Grafana()
    prometheus = Prometheus()
    superset = Superset()
    s3 = S3()
    secretsmanager = SecretsManager()

    airflow >> airbyte >> [s3, postgresql]
    airflow >> dbt >> postgresql
    airflow >> secretsmanager
    grafana >> prometheus
    superset >> postgresql
    prometheus >> airflow
