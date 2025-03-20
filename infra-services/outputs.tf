output "cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "The endpoint URL of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = module.eks.cluster_arn
}

output "cluster_version" {
  description = "EKS cluster version."
  value = module.eks.cluster_version
}

output "cluster_certificate_authority_data" {
  description = "Cluster CA certificate."
  value = module.eks.cluster_certificate_authority_data
}