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

provider "aws" {
  profile = "default"
  region  = "us-east-1"

  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3 = "http://0.0.0.0:4566"
  }
}
