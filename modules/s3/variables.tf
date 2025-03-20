# The name of the S3 bucket
variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

# A flag to attach the bucket policy
variable "attach_bucket_policy" {
  description = "Whether to attach a bucket policy."
  type        = bool
  default     = false
}

# The bucket policy to attach if attach_policy is true
variable "bucket_policy" {
  description = "The bucket policy to attach to the S3 bucket."
  type        = string
  default     = ""
}

# Tags to apply to the S3 bucket
variable "tags" {
  description = "Tags to assign to the S3 bucket."
  type        = map(string)
  default     = {}
}

# A flag to enable or disable versioning for the S3 bucket
variable "versioning_enabled" {
  description = "Whether versioning is enabled for the S3 bucket."
  type        = bool
  default     = false
}

# The lifecycle rules for the S3 bucket
variable "bucket_lifecycle_rule" {
  description = "Lifecycle rules for the S3 bucket."
  type        = any
  default = []
}

# The S3 bucket ownership controls
variable "control_object_ownership" {
  description = "Whether to control object ownership (S3 Object Ownership feature)."
  type        = bool
  default     = true
}


# The expected account ID of the S3 bucket owner
variable "bucket_owner" {
  description = "The account ID of the expected bucket owner."
  type        = string
}

# The Access Control List (ACL) for the S3 bucket

