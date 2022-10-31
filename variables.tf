variable "name" {
  description = "Name of the service. This is used across multiple resources. Example: helloworld"
}

variable "r53zone" {
  description = "Name of the existing route53 zone. Example: example.com"
}

variable "fqdn" {
  description = "Fully qualified domain name. Example: mytask.example.com"
}

variable "image" {
  description = "OCI Image to run as a task. Example: nginx:latest"
}

variable "vpc_id" {
  description = "VPC Id to allocate resources in. Uses default vpc automatically"
  default = ""
}

variable "task_port" {
  description = "Port which the service listens on"
  default = 8080
}

variable "task_cpu" {
  description = "CPU to allocate to the fargate task"
  default = 256
}

variable "task_mem" {
  description = "Memory to allocate to the fargate task"
  default = 512
}