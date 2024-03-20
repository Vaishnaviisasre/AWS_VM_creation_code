

variable "vpc_id" {
  description = "The ID of the VPC"
}


# security Group
variable "security_group_name_prefix" {
  description = "Prefix for the security group name"
  default     = "instance-sg-"
}

variable "ssh_cidr_blocks" {
  description = "CIDR blocks for SSH ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "http_cidr_blocks" {
  description = "CIDR blocks for HTTP ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "https_cidr_blocks" {
  description = "CIDR blocks for HTTP ingress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "CIDR blocks for egress"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}


variable "security_group_name" {
  description = "Name for the security group"
  default     = "my-securitygroup"
}