locals {
  docker_registry = "kind-registry"
}

resource "kind_cluster" "default" {
  name       = "kind-data-platform"
  node_image = "kindest/node:v1.23.4"
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"
    containerd_config_patches = [
      <<-TOML
          [plugins."io.containerd.grpc.v1.cri".registry.mirrors."${local.docker_registry}:5000"]
              endpoint = ["http://${local.docker_registry}:5000"]
          TOML
    ]
  }
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
