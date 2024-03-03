# rds.tf

module "rds" {
  source = "terraform-aws-modules/rds/aws"

  name                      = "my-rds-instance"
  engine                    = "mysql"
  engine_version            = "8.0.23"
  instance_class            = "db.t2.micro"
  allocated_storage         = 20
  username                  = "db_user"
  password                  = "db_password"
  publicly_accessible       = false
  multi_az                  = false
  subnet_ids                = var.subnet_ids
  vpc_security_group_ids    = [module.network.vpc_default_security_group_ids]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
