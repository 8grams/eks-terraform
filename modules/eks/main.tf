locals {
  access_entries = { for user_arn in var.access_entries_users_arns :
    user_arn => {
      kubernetes_groups = ["cluster-admins"]
      principal_arn     = user_arn
      policy_associations = {
        example_policy = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            namespaces = []
            type       = "cluster"
          }
        }
      }
    }
  }
}

# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "v20.34.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  # EKS Addons
  cluster_addons = {
    kube-proxy = {
      most_recent       = true
      resolve_conflicts = "PRESERVE"
    }
    vpc-cni = {
      most_recent       = true
      resolve_conflicts = "PRESERVE"
    }
    coredns = {
      most_recent       = true
      resolve_conflicts = "PRESERVE"
    }
    aws-ebs-csi-driver = {
      service_account_role_arn = module.ebs_csi_irsa_role.iam_role_arn
      most_recent              = true
    }
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  enable_irsa = true

  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_endpoint_private_access = var.cluster_endpoint_private_access

  eks_managed_node_groups                  = var.eks_managed_node_groups
  enable_cluster_creator_admin_permissions = var.enable_cluster_creator_admin_permissions

  access_entries = local.access_entries
  tags = var.tags
}

# http://registry.terraform.io/modules/terraform-aws-modules/iam/aws/
module "ebs_csi_irsa_role" {
  source = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name             = "${var.cluster_name}-ebs-csi"
  attach_ebs_csi_policy = true

  oidc_providers = {
    oidc = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:ebs-csi-controller-sa"]
    }
  }
}

