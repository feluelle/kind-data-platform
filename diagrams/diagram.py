from urllib.request import urlretrieve

from diagrams import Diagram
from diagrams.aws.security import SecretsManager
from diagrams.aws.storage import S3
from diagrams.custom import Custom
from diagrams.onprem.database import Postgresql
from diagrams.onprem.monitoring import Grafana, Prometheus
from diagrams.onprem.workflow import Airflow

# FIXME: Use node from diagrams when available. See https://github.com/mingrammer/diagrams/issues/457 for more information.
airbyte_url = "https://assets.website-files.com/605e01bc25f7e19a82e74788/60895f8dfc189968c33b89d2_airbyte_rounded-rectangle_icon-p1myrdbsr61z7375uuocdxnlmab85b8vry3h73pfk0.png"
airbyte_icon = "./custom/airbyte.png"
urlretrieve(airbyte_url, airbyte_icon)

# Using a proper dbt icon
dbt_url = (
    "https://docs.google.com/uc?export=download&id=1fnsWHRu2a_UkJBJgkZtqt99x5bSyf3Aw"
)
dbt_icon = "./custom/dbt.png"
urlretrieve(dbt_url, dbt_icon)

# Using a proper superset icon
superset_url = "https://www.apache.org/logos/res/superset/superset-2.png"
superset_icon = "./custom/superset.png"
urlretrieve(superset_url, superset_icon)

with Diagram(
    name="kind-data-platform",
    show=False,
    graph_attr={"bgcolor": "transparent", "pad": "0.5"},
):
    airbyte = Custom(label="", icon_path=airbyte_icon)
    airflow = Airflow()
    dbt = Custom(label="", icon_path=dbt_icon)
    postgresql = Postgresql()
    grafana = Grafana()
    prometheus = Prometheus()
    superset = Custom(label="", icon_path=superset_icon)
    s3 = S3()
    secretsmanager = SecretsManager()

    airflow >> airbyte >> [s3, postgresql]
    airflow >> dbt >> postgresql
    airflow >> secretsmanager
    grafana >> prometheus
    superset >> postgresql
    prometheus >> airflow
