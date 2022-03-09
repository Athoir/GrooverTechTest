# Hold the description of the resources in the environment. It is only one file as the test is small but on a larger infrastructure it is better to split your ressources in multiple.

# Setup provider credentials
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

# Create ECS cluster

resource "aws_ecs_cluster" "staging" {
  name = "staging"

  setting {
    # additionnal cluster settings would be here
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
    aws_ecs_cluster.staging,
  ]
}

