terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

module "ec2" {
  source = "./modules/ec2"
  ami_prod_server= var.ami_prod_server
  type_prod_server = var.type_prod_server
  key_name = var.key_name
}