resource "kind_cluster" "default" {
  name       = "kind-data-platform"
  node_image = "kindest/node:v1.22.4"
}

resource "helm_release" "metrics-server" {
  name          = "metrics-server"
  repository    = "https://kubernetes-sigs.github.io/metrics-server/"
  chart         = "metrics-server"
  version       = "3.7.0"
  wait          = false
  wait_for_jobs = false

  set {
    name  = "args[0]"
    value = "--kubelet-insecure-tls"
  }
}
