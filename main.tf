provider "aws" {
  region = "us-east-1" # Set your desired region
}

module "network" {
  source = "./modules/network"
}

module "ecs" {
  source    = "./modules/ecs"
  vpc_id    = module.network.vpc_id
  subnet_ids = module.network.private_subnet_ids
}

module "rds" {
  source    = "./modules/rds"
  subnet_ids = module.network.private_subnet_ids
}