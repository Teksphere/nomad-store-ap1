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


# terraform backend remote for state data
terraform {
  backend "s3" {
    # set bucket details
    bucket = "nomad-prod-state-buck3t"
    key = "prod/services/webserver-cluster/terraform.tfstate"
    region = "us-east-2"

    #dynamo db table details for locking
    dynamodb_table = "nomad-prod-table-locks"
    encrypt = true
  }
}

module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-prod"
  stripe_secret_key = var.stripe_secret_key
  web_app_url = var.web_app_url
  web_hook_secret = var.web_hook_secret

  policy_name = var.policy_name
  role_name = var.role_name

  dns_name= "prod-api"
  log_profile_name= "nomad_prod_logs_profile"

  instance_type = "t2.micro"
  min_size = 2
  max_size = 10
}