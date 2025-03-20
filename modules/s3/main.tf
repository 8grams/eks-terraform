# https://registry.terraform.io/modules/terraform-aws-modules/s3-bucket/aws
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"  
  version = "4.6.0"
  bucket = var.bucket_name
  force_destroy       = true
  request_payer       = "BucketOwner"
  tags = var.tags
  
  # Bucket policies
  attach_policy                            = var.attach_bucket_policy
  policy                                   = var.attach_bucket_policy == true ? var.bucket_policy : null
  attach_deny_insecure_transport_policy    = false
  attach_require_latest_tls_policy         = false
  attach_deny_incorrect_encryption_headers = false
  attach_deny_unencrypted_object_uploads   = false

  block_public_policy     = false
  control_object_ownership = true
  object_ownership         = "BucketOwnerPreferred"
  expected_bucket_owner    = var.bucket_owner
  acl = "private"

  versioning = {
    status     = var.versioning_enabled
    mfa_delete = false
  }

  lifecycle_rule = var.bucket_lifecycle_rule
}