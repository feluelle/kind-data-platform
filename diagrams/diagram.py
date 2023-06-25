from onprem.analytics import Airbyte, Dbt, Superset

from diagrams import Diagram  # type: ignore[attr-defined]
from diagrams.aws.security import SecretsManager
from diagrams.aws.storage import S3
from diagrams.onprem.database import Postgresql
from diagrams.onprem.monitoring import Grafana, Prometheus
from diagrams.onprem.workflow import Airflow

with Diagram(
    filename="k3d-data-platform",
    show=False,
    graph_attr={
        "bgcolor": "#272935",  # snazzy theme
        "dpi": "48.0",
        "pad": "0.5",
    },
    edge_attr={
        "color": "#eff0ea",  # snazzy theme
    },
):
    airbyte = Airbyte()
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
