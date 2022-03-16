resource "kind_cluster" "default" {
  name       = "kind-data-platform"
  node_image = "kindest/node:v1.23.0"
}

resource "helm_release" "metrics-server" {
  # ArtifactHUB: https://artifacthub.io/packages/helm/metrics-server/metrics-server
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.8.2"

  set {
    name  = "args[0]"
    value = "--kubelet-insecure-tls"
  }
}
