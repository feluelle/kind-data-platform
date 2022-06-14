resource "kubernetes_namespace" "airflow" {
  metadata {
    name = "airflow"
  }
}

resource "helm_release" "airflow" {
  # ArtifactHUB: https://artifacthub.io/packages/helm/apache-airflow/airflow
  namespace  = kubernetes_namespace.airflow.metadata.0.name
  name       = "airflow"
  repository = "https://airflow.apache.org"
  chart      = "airflow"
  version    = "1.5.0"
  timeout    = 600
  # DB Migration job does not run when "waiting". See https://github.com/apache/airflow/issues/15340 for more information.
  wait = false

  values = [
    <<EOT
images:
  airflow:
    repository: ${local.docker_registry}:5000/kind-data-platform-airflow
    tag: latest
    pullPolicy: Always

config:
  api:
    auth_backend: airflow.api.auth.backend.basic_auth
  secrets:
    backend: airflow.providers.amazon.aws.secrets.secrets_manager.SecretsManagerBackend
    backend_kwargs: '{"connections_prefix": "airflow/connections", "variables_prefix": "airflow/variables", "endpoint_url": "http://localstack.localstack.svc.cluster.local:4566"}'

webserverSecretKeySecretName: ${kubernetes_secret.airflow_webserver.metadata.0.name}

airflowPodAnnotations.prometheus.io/path: "/metrics"
airflowPodAnnotations.prometheus.io/port: 8080
airflowPodAnnotations.prometheus.io/scrape: true

env:
- name: AWS_DEFAULT_REGION
  value: us-east-1
- name: AWS_ACCESS_KEY_ID
  value: mock_access_key
- name: AWS_SECRET_ACCESS_KEY
  value: mock_secret_key
EOT
  ]
}

resource "random_password" "airflow_webserver_secret_key" {
  length = 16
}

resource "kubernetes_secret" "airflow_webserver" {
  metadata {
    namespace = kubernetes_namespace.airflow.metadata.0.name
    name      = "airflow-webserver"
  }

  data = {
    "webserver-secret-key" = random_password.airflow_webserver_secret_key.result
  }
}
