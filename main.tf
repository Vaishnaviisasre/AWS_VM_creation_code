terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.14.0"
    }
  }

  # backend "s3" {
  #   bucket  = "bucketname"
  #   encrypt = true
  #   key     = "terraform.tfstate"
  #   region  = "eu-central-1"
  # }
}

provider "aws" {
  region = var.region
}

module "test_vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  name                 = var.vpc_name
}

module "test_subnet" {
  source                  = "./modules/subnet"
  vpc_id                  = module.test_vpc.vpc_id
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.availability_zone
  name                    = var.subnet_name
  map_public_ip_on_launch = true
}

module "test_igw" {
  source = "./modules/internet_gateway"
  vpc_id = module.test_vpc.vpc_id
  name   = var.igw_name
}

module "test_route_table" {
  source = "./modules/route_table"
  vpc_id = module.test_vpc.vpc_id
  subnet_id = module.test_subnet.subnet_id
  gateway_id = module.test_igw.internet_gateway_id
  name   = var.route_table_name
}

module "test_security_group" {
  source              = "./modules/security_group"
  #name_prefix         = var.security_group_name_prefix
  vpc_id              = module.test_vpc.vpc_id
  ssh_cidr_blocks     = var.ssh_cidr_blocks
  http_cidr_blocks    = var.http_cidr_blocks
  https_cidr_blocks   = var.https_cidr_blocks
  egress_cidr_blocks  = var.egress_cidr_blocks
  security_group_name = var.security_group_name
}

module "test_instance" {
  source             = "./modules/ec2_instance"
  ami                = var.instance_ami
  instance_type      = var.instance_type
  subnet_id          = module.test_subnet.subnet_id
  security_group_ids = [module.test_security_group.security_group_id]
  name               = var.instance_name
}
