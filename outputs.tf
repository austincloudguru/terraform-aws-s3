output "s3_id" {
  description = <<-EOF
  The name of the bucket.
  EOF
  value       = join("", aws_s3_bucket.this.*.id)
}

output "s3_arn" {
  description = <<-EOF
  The ARN of the bucket. Will be of format arn:aws:s3:::bucketname.
  EOF
  value       = join("", aws_s3_bucket.this.*.arn)
}

output "s3_bucket_domain_name" {
  description = <<-EOF
  The bucket domain name. Will be of format bucketname.s3.amazonaws.com.
  EOF
  value       = join("", aws_s3_bucket.this.*.bucket_domain_name)
}

output "s3_bucket_regional_domain_name" {
  description = <<-EOF
  The bucket region-specific domain name. 
  EOF
  value       = join("", aws_s3_bucket.this.*.bucket_regional_domain_name)
}

output "s3_hosted_zone_id" {
  description = <<-EOF
  The Route 53 Hosted Zone ID for this bucket's region.
  EOF
  value       = join("", aws_s3_bucket.this.*.hosted_zone_id)
}

output "s3_region" {
  description = <<-EOF
  The AWS region this bucket resides in.
  EOF
  value       = join("", aws_s3_bucket.this.*.region)
}

output "s3_object_lock_configuration_id" {
  description = <<-EOF
  The name of the bucket.
  EOF
  value       = join("", aws_s3_bucket_object_lock_configuration.this.*.id)
}

output "s3_accelerate_configuration_id" {
  description = <<-EOF
  The name of the bucket.
  EOF
  value       = join("", aws_s3_bucket_accelerate_configuration.this.*.id)
}

output "s3_acl_id" {
  description = <<-EOF
  The name of the bucket.
  EOF
  value       = join("", aws_s3_bucket_acl.this.*.id)
}

output "s3_versioning_id" {
  description = <<-EOF
  The name of the bucket.
  EOF
  value       = join("", aws_s3_bucket_versioning.this.*.id)
}

output "s3_encryption_id" {
  description = <<-EOF
  The name of the bucket.
  EOF
  value       = join("", aws_s3_bucket_server_side_encryption_configuration.this.*.id)
}
