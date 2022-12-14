# Terraform module for ECS Fargate tasks

This module gives you everything you need to serve a container as an ECS Fargate task.

It assumes that:

- You have a container that listens for http requests on a port
- You have an AWS account with a configured r53 zone to verify creation of ACM certificates

It will create:

- A load balancer to receive incoming http/https requests
- Appropriate security groups
- An https certificate for the load balancer
- An ECS cluster, service, and Fargate task

```mermaid
graph LR
    A[ECS Fargate Service] --> B[ECS Task Definition]
    A --> C[ECS Cluster]
    A --> D[Security Group]
    A --> E[IAM Role]
    A --> F[LB Target Group]
    G[LB Listener] --> F
    G --> H[Load balancer]
    H --> D
    G --> I[ACM Certificate]
    J[R53 Record] --> H
```

Example:

```hcl
module "fargate_task" {
  source = "github.com/kpenfound/terraform-aws-ecs-fargate-task?ref=v1.0.0"

  name = "mytask"
  r53zone = "example.io"
  fqdn = "mytask.example.io"
  image = "example/task:latest"
}
```