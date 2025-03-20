variable "identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string 
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
}

variable "storage_size" {
  description = "The size of the storage in GB"
  type        = number
}

variable "default_db_name" {
  description = "The default database name"
  type        = string
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string  
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "maintenance_window" {
  description = "The maintenance window for the RDS instance"
  type        = string
}

variable "backup_window" {
  description = "The backup window for the RDS instance"
  type        = string
}

variable "tags" {
  description = "Tags for the RDS instance"
  type        = map(string) 
  default     = {}
}

variable "subnet_ids" {
  description = "The subnet IDs for the RDS instance"
  type        = list(string) 
  default     = []
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection for the RDS instance"
  type        = bool
  default     = false
}

variable "vpc_default_security_group_ids" {
  description = "The security group IDs for the RDS instance"
  type        = list(string)
  default     = []  
}

variable "multi_az" {
  description = "Whether to enable multi-AZ for the RDS instance"
  type        = string
}