terraform {
  required_providers {
    kind = {
      source  = "kyma-incubator/kind"
      version = "0.0.11"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.3.0"
    }
  }

  required_version = "1.1.2"
}
