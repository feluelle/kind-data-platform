provider "k3d" {}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-${k3d_cluster.default.name}"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "k3d-${k3d_cluster.default.name}"
  }
}
