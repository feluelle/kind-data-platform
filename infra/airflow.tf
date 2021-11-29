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
  wait          = false
  wait_for_jobs = false

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
