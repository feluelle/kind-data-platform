resource "kubernetes_namespace" "localstack" {
  metadata {
    name = "localstack"
  }
}

resource "helm_release" "localstack" {
  namespace  = kubernetes_namespace.localstack.metadata.0.name
  name       = "localstack"
  repository = "https://localstack.github.io/helm-charts"
  chart      = "localstack"
  version    = "0.3.7"

  values = [
    <<EOT
image:
  tag: 0.13.1

extraEnvVars:
  - name: SERVICES
    value: "s3"
  - name: EAGER_SERVICE_LOADING
    value: "1"
EOT
  ]
}

resource "aws_s3_bucket" "s3" {
  bucket_prefix = "data-lake-"

  depends_on = [
    helm_release.localstack
  ]
}

output "data-lake-s3-bucket" {
  value = aws_s3_bucket.s3.id
}
