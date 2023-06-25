locals {
  docker_registry = "k3d-registry"
}

resource "k3d_cluster" "default" {
  name       = "k3d-data-platform"
  k3d_config = <<EOF
apiVersion: k3d.io/v1alpha5
kind: Simple

registries:
  create:
    name: ${local.docker_registry}
    hostPort: "5001"
EOF
}
