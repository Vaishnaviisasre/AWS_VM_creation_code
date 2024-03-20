variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "cidr_block" {
  description = "The CIDR block for the subnet"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
}

variable "name" {
  description = "The name of the subnet"
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch"
  default     = true
}
