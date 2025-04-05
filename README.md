# AWS EKS Infrastructure with Terraform

This repository contains Terraform configurations to provision a complete AWS infrastructure including EKS (Elastic Kubernetes Service), RDS (Relational Database Service), and supporting services.

## Infrastructure Components

The Terraform code provisions the following AWS resources:

1. **VPC Infrastructure**
   - VPC with multi-AZ architecture
   - Public subnets for internet-facing resources
   - Private subnets for internal resources
   - Database subnets for RDS instances
   - Security groups with configurable rules

2. **EKS Cluster**
   - Managed Kubernetes cluster
   - Configurable node groups
   - IAM roles and policies
   - OIDC provider for service account integration

3. **EKS Add-ons**
   - AWS EFS CSI Driver
   - AWS FSx CSI Driver
   - Cluster Autoscaler
   - Secrets Store CSI Driver
   - Kube Prometheus Stack
   - External DNS
   - Ingress Nginx
   - Cert Manager
   - Metrics Server
   - AWS for Fluentbit
   - AWS Load Balancer Controller

4. **RDS Database**
   - Multi-AZ deployment option
   - Configurable instance type and storage
   - Automated backups
   - Maintenance windows
   - Security group integration

5. **S3 Buckets**
   - Configurable bucket policies
   - Lifecycle rules
   - Access control

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform (v1.0.0 or later)
- kubectl
- aws-iam-authenticator

## Usage

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd eks-terraform
   ```

2. Navigate to the infrastructure services directory:
   ```bash
   cd infra-services
   ```

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the planned changes:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Configuration

The main configuration file is `infra-services/terraform.tfvars`. Here you can customize:

- VPC CIDR and subnet configurations
- EKS cluster settings
- Node group configurations
- RDS instance parameters
- S3 bucket settings
- Security group rules

## Module Structure

The repository is organized into the following modules:

- `modules/vpc`: VPC and networking components
- `modules/eks`: EKS cluster and node groups
- `modules/eks-addons`: Kubernetes add-ons and controllers
- `modules/rds`: Database instance and configuration
- `modules/s3`: S3 bucket creation and policies
- `modules/security-group`: Security group rules and configurations

## Security Considerations

- All resources are tagged with environment and owner information
- Security groups are configured with minimal required access
- RDS instances can be configured with deletion protection
- S3 bucket policies are customizable for access control

## Maintenance

- Regular Terraform state updates are recommended
- Monitor AWS costs and resource usage
- Keep Terraform and provider versions up to date
- Review and update security group rules as needed

## License

MIT