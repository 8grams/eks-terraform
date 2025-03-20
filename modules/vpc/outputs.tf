output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "private_subnets" {
  description = "List of private subnet IDs."
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of public subnet IDs."
  value       = module.vpc.public_subnets
}

output "database_subnets" {
  description = "List of database subnet IDs."
  value       = module.vpc.database_subnets
}

output "db_subnet_group_name" {
  description = "The DB subnet group name."
  value = module.vpc.database_subnet_group_name
}