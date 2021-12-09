resource "kubernetes_namespace" "airbyte" {
  metadata {
    name = "airbyte"
  }
}

# TODO: Use official Airbyte Helm Repo once published
#   See https://github.com/airbytehq/airbyte/issues/1868 for more information
resource "helm_release" "airbyte" {
  namespace  = kubernetes_namespace.airbyte.metadata.0.name
  name       = "airbyte"
  repository = "https://raw.githubusercontent.com/feluelle/airbyte/feature/add-chart-repo/charts"
  chart      = "airbyte"
  version    = "0.3.0"
  timeout    = 600
  wait       = false
}
