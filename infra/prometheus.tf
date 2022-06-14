resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = "prometheus"
  }
}

resource "helm_release" "prometheus" {
  # ArtifactHUB: https://artifacthub.io/packages/helm/prometheus-community/prometheus
  namespace  = kubernetes_namespace.prometheus.metadata.0.name
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "15.10.1"
}
