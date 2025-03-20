variable "aws_region" {
  description = "AWS Region name in which resources are being deployed."
  type        = string
}

variable "vpc_name" {
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

# eks
variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_version" {
  description = "The version of Kubernetes to use for the EKS cluster."
  type        = string
}
variable "access_entries_users_arns" {
  description = "The list of Users ARNs"
  default     = []
  type        = list(string)
}

variable "eks_managed_node_groups" {
  description = "A map of EKS managed node group configurations."
  type = map(object({
    ami_type       = string
    instance_types = list(string)
    min_size       = number
    max_size       = number
    desired_size   = number
  }))
  default = {}
}

variable "cluster_endpoint_public_access" {
  description = "Enable or disable public access to the EKS cluster endpoint."
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Enable or disable private access to the EKS cluster endpoint."
  type        = bool
  default     = true
}

# eks addons
# Enable Cluster Autoscaler
variable "enable_cluster_autoscaler" {
  description = "Enable Cluster Autoscaler"
  type        = bool
  default     = false
}

# Enable Kube Prometheus Stack
variable "enable_kube_prometheus_stack" {
  description = "Enable Kube Prometheus Stack"
  type        = bool
  default     = false
}

# Enable External Secrets
variable "enable_external_secrets" {
  description = "Enable External Secrets"
  type        = bool
  default     = false
}

# Enable Ingress NGINX
variable "enable_ingress_nginx" {
  description = "Enable Ingress NGINX"
  type        = bool
  default     = false
}

# Enable Cert Manager
variable "enable_cert_manager" {
  description = "Enable Cert Manager"
  type        = bool
  default     = false
}

# Enable AWS Load Balancer Controller
variable "enable_aws_load_balancer_controller" {
  description = "Enable AWS Load Balancer Controller"
  type        = bool
  default     = false
}

# Enable Metrics Server
variable "enable_metrics_server" {
  description = "Enable Metrics Server"
  type        = bool
  default     = false
}

# Enable Secrets Store CSI Driver
variable "enable_secrets_store_csi_driver" {
  description = "Enable Secrets Store CSI Driver"
  type        = bool
  default     = true
}

# Enable Secrets Store CSI Driver Provider AWS
variable "enable_secrets_store_csi_driver_provider_aws" {
  description = "Enable Secrets Store CSI Driver Provider for AWS"
  type        = bool
  default     = true
}

# Enable AWS Fluent Bit
variable "enable_aws_for_fluentbit" {
  description = "Enable AWS Fluent Bit"
  type        = bool
  default     = false
}


# Enable External DNS
variable "enable_external_dns" {
  description = "Flag to enable External DNS"
  type        = bool
  default     = false
}

# Enable AWS EFS CSI Driver
variable "enable_aws_efs_csi_driver" {
  description = "Flag to enable AWS EFS CSI Driver"
  type        = bool
  default     = false
}

# Enable AWS FSx CSI Driver
variable "enable_aws_fsx_csi_driver" {
  description = "Flag to enable AWS FSx CSI Driver"
  type        = bool
  default     = false
}

# Enable Vertical Pod Autoscaler (VPA)
variable "enable_vpa" {
  description = "Flag to enable Vertical Pod Autoscaler (VPA)"
  type        = bool
  default     = false
}

# rds
variable "rds_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
  default     = "my-rds"
}

variable "rds_engine_version" {
  description = "The version of the database engine to use"
  type        = string  
  default     = "15.8"
}

variable "rds_instance_type" {
  description = "The instance type to use"
  type        = string
  default     = "db.t3.small"
}

variable "rds_storage_size" {
  description = "The size of the storage in GB"
  type        = number
  default     = 80
}

variable "rds_default_db_name" {
  description = "The default database name"
  type        = string
  default     = "mydb"
}

variable "rds_username" {
  description = "The username for the database"
  type        = string
  default     = "pph2025"
}

variable "rds_maintenance_window" {
  description = "The maintenance window for the RDS instance"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "rds_backup_window" {
  description = "The backup window for the RDS instance"
  type        = string
  default     = "03:00-06:00"
}

variable "rds_deletion_protection" {
  description = "Whether to enable deletion protection for the RDS instance"
  type        = bool
  default     = false 
}

variable "rds_multi_az" {
  description = "Whether to enable multi-AZ for the RDS instance"
  type        = bool
  default     = false
}

# S3 bucket variables
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = list(string)
}

variable "attach_bucket_policy" {
  description = "Whether to attach a policy to the bucket"
  type        = bool
}

variable "bucket_policy" {
  description = "The policy to attach to the bucket"
  type        = string
  default     = ""
}

variable "bucket_lifecycle_rule" {
  description = "Lifecycle rules for the bucket"
  type        = any
}

variable "default_owner" {
  description = "The owner of the resources"
  type        = string
  default     = "terraform"
}

variable "default_environment" {
  description = "The environment of the resources"
  type        = string
  default     = "production"
}

variable "default_sg_ingress_cidr_blocks" {
  description = "The list of ingress CIDR blocks for the RDS security group"
  type        = list(map(string))
  default     = []
}

variable "default_sg_egress_cidr_blocks" {
  description = "The list of egress CIDR blocks for the RDS security group"
  type        = list(map(string))
  default     = []    
}