# https://registry.terraform.io/providers/hashicorp/aws/latest
terraform {
  required_version = ">=1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40"
    }
  }
}

# =============================

provider "aws" {
  region = var.region
}

module "network" {
  source = "./modules/networking"
  availability_zones = var.availability_zones
  cidr_block         = var.cidr_block
  public_subnet_ips  = var.public_subnet_ips
  private_subnet_ips = var.private_subnet_ips
  vpc_name           = var.vpc_name
}