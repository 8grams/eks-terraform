# https://registry.terraform.io/modules/terraform-aws-modules/rds-aurora/aws/
module "rds" {
  source = "terraform-aws-modules/rds/aws"

  identifier = var.identifier

  engine            = "postgres"
  engine_version    = var.engine_version
  instance_class    = var.instance_type
  allocated_storage = var.storage_size
  multi_az          = var.multi_az

  db_name               = var.default_db_name
  username              = var.username
  port                  = "5432"
  family                = "postgres15"
  major_engine_version  = "15"
  db_subnet_group_name  = var.db_subnet_group_name

  vpc_security_group_ids              = var.vpc_default_security_group_ids
  iam_database_authentication_enabled = true

  maintenance_window  = var.maintenance_window
  backup_window       = var.backup_window
  deletion_protection = var.deletion_protection

  tags       = var.tags
  subnet_ids = var.subnet_ids
}