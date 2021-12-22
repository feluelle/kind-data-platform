provider "kind" {}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kind-${kind_cluster.default.name}"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "kind-${kind_cluster.default.name}"
  }
}
