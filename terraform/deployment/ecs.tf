resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.app_name}-cluster"
  tags = {
    Environment = var.tag-name
  }
}

resource "aws_ecs_task_definition" "aws-ecs-task" {
  family = "${var.app_name}-task"

  container_definitions = <<DEFINITION
  [
    {
      "name": "${var.app_name}-container",
      "image": "${var.ecr_image}",
      "entryPoint": [],
      "essential": true,
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "${aws_cloudwatch_log_group.log-group.id}",
          "awslogs-region": "${var.region}",
          "awslogs-stream-prefix": "${var.app_name}"
        }
      },
      "portMappings": [
        {
          "containerPort": 8080,
          "hostPort": 8080,
           "protocol": "tcp"
        }
      ],
      "cpu": 256,
      "memory": 512
    }
  ]
  DEFINITION

  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = "512"
  cpu                      = "256"
  task_role_arn            = var.ecs_role # for pulling the container image from ECR and writing logs to CloudWatch.
  execution_role_arn       = var.ecs_role # for any permissions your application requires (e.g., S3, RDS access).

  tags = {
    Environment = var.tag-name
  }
}


data "aws_ecs_task_definition" "main" {
  task_definition = aws_ecs_task_definition.aws-ecs-task.family
}
