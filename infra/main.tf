resource "kind_cluster" "default" {
  name       = "kind-data-platform"
  node_image = "kindest/node:v1.23.0"
}

resource "helm_release" "metrics-server" {
  name       = "metrics-server"
  repository = "https://kubernetes-sigs.github.io/metrics-server/"
  chart      = "metrics-server"
  version    = "3.7.0"

  set {
    name  = "args[0]"
    value = "--kubelet-insecure-tls"
  }
}
