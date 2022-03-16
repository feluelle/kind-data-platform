resource "kubernetes_namespace" "localstack" {
  metadata {
    name = "localstack"
  }
}

resource "helm_release" "localstack" {
  # GitHub: https://github.com/localstack/helm-charts
  namespace  = kubernetes_namespace.localstack.metadata.0.name
  name       = "localstack"
  repository = "https://localstack.github.io/helm-charts"
  chart      = "localstack"
  version    = "0.3.7"

  values = [
    <<EOT
image:
  tag: 0.13.2

extraEnvVars:
  - name: SERVICES
    value: "s3,secretsmanager"
  - name: EAGER_SERVICE_LOADING
    value: "1"
EOT
  ]
}
