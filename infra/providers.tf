terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.11"
    }
  }
}

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
