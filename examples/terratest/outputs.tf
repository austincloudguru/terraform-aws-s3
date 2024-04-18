output "s3_arn" {
  value       = module.s3_bucket.s3_arn
  description = "Key ARN"
}

output "s3_id" {
  value       = module.s3_bucket.s3_id
  description = "Key ID"
}

output "s3_object_lock_configuration_id" {
  value       = module.s3_bucket.s3_object_lock_configuration_id
  description = "Bucket Id"
}

output "s3_accelerate_configuration_id" {
  value       = module.s3_bucket.s3_accelerate_configuration_id
  description = "Bucket Id"
}

output "s3_versioning_id" {
  value       = module.s3_bucket.s3_versioning_id
  description = "Bucket Id"
}

output "s3_encryption_id" {
  value       = module.s3_bucket.s3_encryption_id
  description = "Bucket Id"
}
