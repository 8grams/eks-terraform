variable "name" {
  description = "The name of the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "azs" {
  description = "List of availability zones for the VPC."
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the VPC and its resources."
  type        = map(string)
  default     = {}
}

variable "create_database_subnet_group" {
  description = "Whether to create a database subnet group for RDS."
  type        = bool
  default     = false
}

variable "manage_default_network_acl" {
  description = "Whether to manage the default network ACL."
  type        = bool
  default     = false
}

variable "manage_default_route_table" {
  description = "Whether to manage the default route table."
  type        = bool
  default     = false
}

variable "manage_default_security_group" {
  description = "Whether to manage the default security group."
  type        = bool
  default     = false
}

variable "enable_dns_hostnames" {
  description = "Whether to enable DNS hostnames in the VPC."
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Whether to enable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "enable_nat_gateway" {
  description = "Whether to enable NAT gateway in the VPC."
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Whether to use a single NAT gateway for the VPC."
  type        = bool
  default     = true
}

variable "public_subnet_tags" {
  description = "A map of tags to assign to public subnets."
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "A map of tags to assign to private subnets."
  type        = map(string)
  default     = {}
}
