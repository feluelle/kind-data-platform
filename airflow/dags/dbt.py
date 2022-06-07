from airflow.decorators import dag
from airflow.kubernetes.secret import Secret
from airflow.providers.cncf.kubernetes.operators.kubernetes_pod import (
    KubernetesPodOperator,
)
from airflow.utils.dates import days_ago
from kubernetes.client import models as k8s


@dag(start_date=days_ago(1), schedule_interval=None, tags=["example"])
def dbt():
    """Define an example DBT DAG which calls DBT commands inside a Kubernetes Pod."""
    KubernetesPodOperator(
        task_id="dbt_run",
        task_concurrency=1,
        cmds=["run"],
        name="dbt_run",
        namespace="dbt",
        image="kind-data-platform-dbt:latest",
        image_pull_policy="Never",
        env_vars=[
            k8s.V1EnvVar(name="DBT_POSTGRES_HOST", value="postgresql"),
            k8s.V1EnvVar(name="DBT_POSTGRES_USER", value="postgres"),
            k8s.V1EnvVar(name="DBT_POSTGRES_DB", value="postgres"),
            k8s.V1EnvVar(name="DBT_POSTGRES_PORT", value="5432"),
        ],
        secrets=[
            Secret(
                "env",
                "DBT_POSTGRES_PASSWORD",
                "postgresql",
                "postgresql-password",
            ),
        ],
        is_delete_operator_pod=True,
        in_cluster=True,
    )


dag = dbt()
