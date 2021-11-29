resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = "prometheus"
  }
}

resource "helm_release" "prometheus" {
  namespace     = kubernetes_namespace.prometheus.metadata.0.name
  name          = "prometheus"
  repository    = "https://prometheus-community.github.io/helm-charts"
  chart         = "prometheus"
  version       = "14.11.1"
  wait          = false
  wait_for_jobs = false
}

