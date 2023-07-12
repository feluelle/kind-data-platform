terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.11"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.22.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.10.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.0"
    }
  }

  required_version = "1.4.2"
}
