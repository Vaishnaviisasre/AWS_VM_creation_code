variable "ami" {
  description = "The AMI ID for the instance"
}

variable "instance_type" {
  description = "The instance type"
}

variable "subnet_id" {
  description = "The ID of the subnet"
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to the instance"
  type        = list(string)
}

variable "name" {
  description = "The name of the instance"
}
