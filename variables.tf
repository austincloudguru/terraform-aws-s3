variable "bucket" {
  description = <<-EOF
  The name of the bucket. If omitted, Terraform will assign a random, unique name. 
  Must be lowercase and less than or equal to 63 characters in length.
  EOF
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = <<-EOF
  Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket.
  Must be lowercase and less than or equal to 37 characters in length.
  EOF
  type        = string
  default     = null
}

variable "force_destroy" {
  description = <<-EOF
  A boolean that indicates all objects (including any locked objects) should be deleted
  from the bucket so that the bucket can be destroyed without error. 
  These objects are not recoverable.
  Valid values are true or false.
  EOF
  type        = bool
  default     = false
}

variable "object_lock_enabled" {
  description = <<-EOF
  Indicates whether this bucket has an Object Lock configuration enabled.
  Valid values are true or false.
  EOF
  type        = bool
  default     = false
}

variable "tags" {
  description = <<-EOF
  A map of tags to add to all resources
  EOF
  type        = map(string)
  default     = {}
}

variable "block_public_acls" {
  description = <<-EOF
  Whether Amazon S3 should block public ACLs for this bucket.
  EOF
  type        = bool
  default     = true
}

variable "block_public_policy" {
  description = <<-EOF
  Whether Amazon S3 should block public bucket policies for this bucket.
  EOF
  type        = bool
  default     = true
}

variable "ignore_public_acls" {
  description = <<-EOF
  Whether Amazon S3 should ignore public ACLs for this bucket. 
  EOF
  type        = bool
  default     = true
}

variable "restrict_public_buckets" {
  description = <<-EOF
  Whether Amazon S3 should restrict public bucket policies for this bucket.
  EOF
  type        = bool
  default     = true
}

variable "object_lock_configuration" {
  description = <<-EOF
  A configuration for S3 object locking. With S3 Object Lock, you can store objects using a `write once, read many` (WORM) model.
  Object Lock can help prevent objects from being deleted or overwritten for a fixed amount of time or indefinitely."
  EOF
  type = object({
    mode  = string # Valid values are GOVERNANCE and COMPLIANCE.
    days  = number
    years = number
  })
  default = null
}

variable "accelerate_configuration" {
  description = <<-EOF
  The transfer acceleration state of the bucket. Valid values: Enabled, Suspended.
  EOF
  type        = string
  default     = null
}

variable "acl" {
  description = <<-EOF
  The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, 
  authenticated-read, and log-delivery-write.
  EOF
  type        = string
  default     = "private"
}

variable "cors_rules" {
  description = <<-EOF
  Specifies the allowed headers, methods, origins and exposed headers when using CORS on this bucket
  EOF
  type = list(object({
    allowed_headers = list(string)
    allowed_methods = list(string)
    allowed_origins = list(string)
    expose_headers  = list(string)
    max_age_seconds = number
  }))
  default = null

}

variable "access_control_policy" {
  description = <<-EOF
  An ACL policy grant. Conflicts with `acl`
  EOF
  type        = map(any)
  default     = {}
}

variable "logging" {
  description = <<-EOF
  Bucket access logging configuration.
  EOF
  type = object({
    bucket_name = string
    prefix      = string
  })
  default = null
}

variable "request_payer" {
  description = <<-EOF
  Specifies who pays for the download and request fees. Valid values: BucketOwner, Requester.
  EOF
  type        = string
  default     = null
}

variable "bucket_key_enabled" {
  description = <<-EOF
  Set this to true to use Amazon S3 Bucket Keys for SSE-KMS, which reduce the cost of AWS KMS requests.
  EOF
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = <<-EOF
  The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms`
  EOF
  type        = string
  default     = "aws:kms"
}

variable "kms_master_key_id" {
  description = <<-EOF
  The AWS KMS master key ARN used for the `SSE-KMS` encryption. This can only be used when you set 
  the value of `sse_algorithm` as `aws:kms`. The default aws/s3 AWS KMS master key is used if this element 
  is absent while the `sse_algorithm` is `aws:kms`
  EOF
  type        = string
  default     = ""
}

variable "bucket_policies" {
  description = <<-EOF
  Additional IAM policies for the bucket
  EOF
  type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = null
}

variable "replication_policies" {
  description = <<-EOF
  Additional IAM policies for the bucket replication
  EOF
  type = list(object({
    effect    = string
    actions   = list(string)
    resources = list(string)
  }))
  default = null
}

variable "versioning_status" {
  description = <<-EOF
  The versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. 
  Disabled should only be used when creating or importing resources that correspond 
  to unversioned S3 buckets.
  EOF
  type        = string
  default     = "Disabled"
}

variable "lifecycle_rules" {
  description = <<-EOF
  A map that contains the lifecycle_rule configuration.
  EOF
  type        = any
  default     = {}
  #default     = null
}

variable "website" {
  description = <<-EOF
  Map containing static web-site hosting or redirect configuration.
  EOF
  type        = any # map(string)
  default     = {}
}

variable "replication_configuration" {
  description = <<-EOF
  Map containing cross-region replication configuration.
  EOF
  type        = any
  default     = {}
}

variable "object_ownership" {
  description = <<-EOF
  Object ownership. Valid values: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced
  EOF
  type        = string
  default     = "BucketOwnerPreferred"
  validation {
    condition     = contains(["BucketOwnerPreferred", "ObjectWriter", "BucketOwnerEnforced"], var.object_ownership)
    error_message = "Please set to the proper bucket ownership value: BucketOwnerPreferred, ObjectWriter or BucketOwnerEnforced."
  }
}
