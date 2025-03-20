# eks-terraform

Provision AWS EKS + RDS using Terraform.

## Usage

```
~$ cd infra-services
~$ terraform init
~$ terraform apply
```

## Content

*More details will be available soon

This Terraform code will produce:
1. VPC
2. 3 multi-az Subnet: public, private, and db subnet
3. Security Group
4. S3 Bucket
5. RDS
6. EKS and some addons like cluster auto-scaler, ingress nginx, etc

## Modify

To modify, adjust any values in `infra-services/terraform.tfvars`.