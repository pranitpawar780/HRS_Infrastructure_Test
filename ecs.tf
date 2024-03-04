# ecs.tf

module "ecs" {
  source = "terraform-aws-modules/ecs/aws"

  name            = "my-ecs-cluster"
  cluster_size    = 2  # Number of instances in the ECS cluster
  ecs_instance_type = "t2.micro"

  subnets             = var.subnet_ids
  security_group_ids  = [module.network.vpc_default_security_group_ids]

  services = {
    my_microservice_1 = {
      desired_count  = 2
      image          = "docker-image-url-for-microservice-1"
      container_port = 8080
      container_name = "microservice-1"
      environment    = {
        KEY1 = "value1",
        KEY2 = "value2",
      }
    }

    my_microservice_2 = {
      desired_count  = 1
      image          = "your-docker-image-url-for-microservice-2"
      container_port = 8080
      container_name = "microservice-2"
      environment    = {
        KEY3 = "value3",
        KEY4 = "value4",
      }
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
