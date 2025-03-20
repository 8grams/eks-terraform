output "instance_arn" {
  description = "Amazon Resource Name (ARN) of instance"
  value       = module.rds.db_instance_arn
}

output "instance_id" {
  description = "The RDS instance Identifier"
  value       = module.rds.db_instance_identifier
}

output "instance_resource_id" {
  description = "The RDS instance Resource ID"
  value       = module.rds.db_instance_resource_id
}

output "instance_endpoints" {
  description = "The RDS instance Endpoint"
  value       = module.rds.db_instance_endpoint
}