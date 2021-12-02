resource "kubernetes_namespace" "superset" {
  metadata {
    name = "superset"
  }
}

resource "helm_release" "superset" {
  namespace  = kubernetes_namespace.superset.metadata.0.name
  name       = "superset"
  repository = "https://apache.github.io/superset"
  chart      = "superset"
  version    = "0.4.0"
  timeout    = 600
}
