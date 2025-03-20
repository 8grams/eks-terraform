data "aws_caller_identity" "current" {}

data "terraform_remote_state" "eks" {
  backend = "local"
}

# vpc
module "vpc" {
  source   = "../modules/vpc"
  name     = var.vpc_name
  vpc_cidr = var.vpc_cidr
  azs      = var.azs
  tags = {
    owner       = "terraform"
    environment = var.default_environment
    org         = var.default_owner
  }
  public_subnet_tags  = var.public_subnet_tags
  private_subnet_tags = var.private_subnet_tags
}

# eks
module "eks" {
  source          = "../modules/eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id          = module.vpc.vpc_id
  private_subnets = module.vpc.private_subnets

  eks_managed_node_groups = var.eks_managed_node_groups

  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  access_entries_users_arns = var.access_entries_users_arns

  tags = {
    owner      = "terraform"
    environment = var.default_environment
    org         = var.default_owner
  }
}

# eks addons
module "eks_addons" {
  source = "../modules/eks-addons"

  eks_cluster_name      = module.eks.cluster_name
  eks_cluster_endpoint  = module.eks.cluster_endpoint
  eks_cluster_version   = module.eks.cluster_version
  eks_oidc_provider_arn = module.eks.eks_oidc_provider_arn

  enable_aws_efs_csi_driver                    = var.enable_aws_efs_csi_driver
  enable_aws_fsx_csi_driver                    = var.enable_aws_fsx_csi_driver
  enable_cluster_autoscaler                    = var.enable_cluster_autoscaler
  enable_secrets_store_csi_driver              = var.enable_secrets_store_csi_driver
  enable_secrets_store_csi_driver_provider_aws = var.enable_secrets_store_csi_driver_provider_aws
  enable_kube_prometheus_stack                 = var.enable_kube_prometheus_stack
  enable_external_dns      = var.enable_external_dns
  enable_ingress_nginx     = var.enable_ingress_nginx
  enable_cert_manager      = var.enable_cert_manager
  enable_metrics_server    = var.enable_metrics_server
  enable_aws_for_fluentbit = var.enable_aws_for_fluentbit
  
  enable_aws_load_balancer_controller = var.enable_aws_load_balancer_controller
  
  tags = {
    owner       = "terraform"
    environment = var.default_environment
    org         = var.default_owner
  }
}

# rds
module "rds" {
  source = "../modules/rds"

  identifier        = var.rds_identifier
  engine_version    = var.rds_engine_version
  instance_type     = var.rds_instance_type
  storage_size      = var.rds_storage_size
  default_db_name   = var.rds_default_db_name
  username          = var.rds_username
  subnet_ids        = module.vpc.database_subnets
  multi_az          = var.rds_multi_az

  maintenance_window    = var.rds_maintenance_window
  backup_window         = var.rds_backup_window
  deletion_protection   = var.rds_deletion_protection
  db_subnet_group_name  = module.vpc.db_subnet_group_name
  
  vpc_default_security_group_ids = [module.vpc_default_sg.security_group_id]
  
  tags = {
    owner       = "terraform"
    environment = var.default_environment
    org         = var.default_owner
  }
}

# s3
module "s3_bucket" {
  source = "../modules/s3" 

  count = length(var.bucket_name)

  bucket_name = var.bucket_name[count.index]
  bucket_owner = data.aws_caller_identity.current.account_id
  
  attach_bucket_policy = var.attach_bucket_policy
  bucket_lifecycle_rule = var.bucket_lifecycle_rule

  bucket_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
      "AWS": "*"
      },
      "Action": ["s3:*"],
      "Resource": [
        "arn:aws:s3:::${var.bucket_name[count.index]}", 
        "arn:aws:s3:::${var.bucket_name[count.index]}/*"
      ]
    }
  ]
}
EOF

}

# security group
module "vpc_default_sg" {
  source = "../modules/security-group"

  vpc_id = module.vpc.vpc_id
  
  ingress_cidr_blocks = var.default_sg_ingress_cidr_blocks
  egress_cidr_blocks = var.default_sg_egress_cidr_blocks

  tags = {
    owner       = "terraform"
    environment = var.default_environment
    org         = var.default_owner
  }
}