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
  repository = "https://contra.github.io/helm-charts/charts/airbyte/"
  chart      = "airbyte"
  version    = "0.3.0"
  # The helm chart takes a lot of time to initialize, therefore we need to increase the timeout.
  timeout = 600
  # We can not wait due to an issue with the helm chart
  wait = false

  set {
    name  = "version"
    value = "0.39.13-alpha"
  }
}
