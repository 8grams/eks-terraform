# Name of AWS region
aws_region = "ap-southeast-3"

# Name of the VPC
vpc_name = "my-vpc"

# CIDR block for the VPC
vpc_cidr = "10.10.0.0/16"

default_sg_ingress_cidr_blocks = [{
  from_port   = 5432
  to_port     = 5432
  protocol    = "tcp"
  description = "Allow PostgreSQL access"
  cidr_blocks = "10.10.0.0/16"
}]

default_sg_egress_cidr_blocks = [{
  from_port   = 0
  to_port     = 0
  protocol    = "-1"  # Allow all outbound traffic
  cidr_blocks = "0.0.0.0/0"
}]

# Availability Zones to be used in the VPC
azs = ["ap-southeast-3a", "ap-southeast-3b"]

# Private Subnet Tags
private_subnet_tags = {
  "kubernetes.io/role/internal-elb" = 1
}
# Public Subnet tags
public_subnet_tags = {
  "kubernetes.io/role/elb" = 1
}

cluster_name                    = "my-eks-cluster"
cluster_version                 = "1.32"
cluster_endpoint_public_access  = true
cluster_endpoint_private_access = true

# change this!
# format: arn:aws:iam::10XXX:user/<user name>
access_entries_users_arns = [""]

eks_managed_node_groups = {
  primary = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.small"]
    min_size       = 2
    max_size       = 5
    desired_size   = 3
  }
}

# EKS Addon Features
enable_cluster_autoscaler = true
enable_kube_prometheus_stack = false
enable_external_secrets  = true
enable_ingress_nginx     = false
enable_cert_manager      = true
enable_aws_load_balancer_controller = true
enable_metrics_server    = true
enable_secrets_store_csi_driver = false
enable_secrets_store_csi_driver_provider_aws = false
enable_aws_for_fluentbit = false

# Storage Addons
enable_external_dns      = false
enable_aws_efs_csi_driver = false
enable_aws_fsx_csi_driver = false

# Other Addons
enable_vpa               = false

# rds
rds_identifier = "my-rds"
rds_username = "ppg2025"
rds_instance_type = "db.t3.small"
rds_maintenance_window = "Mon:00:00-Mon:03:00"
rds_backup_window      = "03:00-06:00"
rds_storage_size = 160
rds_engine_version = "15.8"
rds_default_db_name = "mydb"
rds_deletion_protection = true
rds_multi_az = true

# s3 bucket variables
bucket_name           = ["my-bucket"]
attach_bucket_policy  = true
bucket_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::my-bucket", 
        "arn:aws:s3:::my-bucket/*"
      ]
    }
  ]
}
EOF
bucket_lifecycle_rule = []