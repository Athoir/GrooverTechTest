# Hold the description of the resources in the environment. It is only one file as the test is small but on a larger infrastructure it is better to split your ressources in multiple.

# Setup provider credentials
provider "aws" {
  region     = "eu-west-1"
  access_key = "my-access-key"
  secret_key = "my-secret-key"
}

# Create ECS cluster

resource "aws_ecs_cluster" "production" {
  name = "production"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


# Create the hello world container

resource "aws_ecs_task_definition" "hello" {
  family = "service"
  container_definitions = file("tasks/hello.json")
  # Set dependency
  depends_on = [    
    aws_ecs_cluster.production,
  ]
}

