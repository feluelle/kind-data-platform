resource "kubernetes_namespace" "airflow" {
  metadata {
    name = "airflow"
  }
}

resource "helm_release" "airflow" {
  namespace     = kubernetes_namespace.airflow.metadata.0.name
  name          = "airflow"
  repository    = "https://airflow.apache.org"
  chart         = "airflow"
  version       = "1.3.0"
  # DB Migration job does not run when "waiting". See https://github.com/apache/airflow/issues/15340 for more information.
  wait = false

  set {
    name  = "airflowPodAnnotations\\.prometheus\\.io/scrape"
    value = "true"
  }
  set {
    name  = "airflowPodAnnotations\\.prometheus\\.io/path"
    value = "/metrics"
  }
  set {
    name  = "airflowPodAnnotations\\.prometheus\\.io/port"
    value = "8080"
  }
}
