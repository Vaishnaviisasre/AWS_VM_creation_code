variable "cidr_block" {
  description = "The CIDR block for the VPC"
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support for the VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames for the VPC"
  default     = true
}

variable "name" {
  description = "The name of the VPC"
}
