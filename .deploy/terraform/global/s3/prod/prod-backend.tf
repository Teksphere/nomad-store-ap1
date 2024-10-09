terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-2"
}

module "backend_config" {
  source = "../../../modules/backends/s3"

  bucket_name = "nomad-prod-state-buck3t"
  dynamodb_name = "nomad-prod-table-locks"
}