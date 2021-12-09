from diagrams import Diagram
from diagrams.onprem.analytics import Dbt, Superset
from diagrams.onprem.database import Postgresql
from diagrams.onprem.monitoring import Grafana, Prometheus
from diagrams.onprem.workflow import Airflow

# TODO: Add Airbyte to diagram
with Diagram(name="kind-data-platform", show=False):
    airflow = Airflow()
    dbt = Dbt()
    postgresql = Postgresql()
    grafana = Grafana()
    prometheus = Prometheus()
    superset = Superset()

    airflow >> dbt >> postgresql
    grafana >> prometheus
    superset >> postgresql
    prometheus >> [airflow, postgresql, superset]
