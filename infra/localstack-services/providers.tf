provider "aws" {
  profile = "default"
  region  = "us-east-1"

  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3             = "http://0.0.0.0:4566"
    secretsmanager = "http://0.0.0.0:4566"
  }
}
