# Terraform module
[![Terratest](https://github.com/austincloudguru/terraform-module-template/workflows/Terratest/badge.svg?event=push)](https://github.com/austincloudguru/terraform-module-template/actions?query=workflow%3ATerratest) 
![Latest Version](https://img.shields.io/github/v/tag/austincloudguru/terraform-module-template?sort=semver&label=Latest%20Version)
[![License](https://img.shields.io/github/license/austincloudguru/terraform-module-template)](https://github.com/austincloudguru/terraform-module-template/blob/master/LICENSE)

Terraform module that creates a S3 bucket on AWS.

## Usage
```hcl
module "s3_bucket" {
  source                  = "AustinCloudGuru/alb/aws/s3"
  # You should pin the module to a specific version
  # version                 = "x.x.x"
  bucket                    = join("-", ["terratest", var.s3_suffix])
  force_destroy             = true
  object_lock_enabled       = var.object_lock_enabled
  object_lock_configuration = var.object_lock_configuration
  accelerate_configuration  = var.accelerate_configuration
  tags                      = var.tags
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0, < 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_accelerate_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_accelerate_configuration) | resource |
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_cors_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_cors_configuration) | resource |
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_logging.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_object_lock_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object_lock_configuration) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_replication_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_replication_configuration) | resource |
| [aws_s3_bucket_request_payment_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_request_payment_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_website_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_website_configuration) | resource |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.replication_assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.replication_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_accelerate_configuration"></a> [accelerate\_configuration](#input\_accelerate\_configuration) | The transfer acceleration state of the bucket. Valid values: Enabled, Suspended. | `string` | `null` | no |
| <a name="input_access_control_policy"></a> [access\_control\_policy](#input\_access\_control\_policy) | An ACL policy grant. Conflicts with `acl` | `map(any)` | `{}` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply. Valid values are private, public-read, public-read-write, aws-exec-read, <br>authenticated-read, and log-delivery-write. | `string` | `"private"` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the bucket. If omitted, Terraform will assign a random, unique name. <br>Must be lowercase and less than or equal to 63 characters in length. | `string` | `null` | no |
| <a name="input_bucket_key_enabled"></a> [bucket\_key\_enabled](#input\_bucket\_key\_enabled) | Set this to true to use Amazon S3 Bucket Keys for SSE-KMS, which reduce the cost of AWS KMS requests. | `bool` | `true` | no |
| <a name="input_bucket_policies"></a> [bucket\_policies](#input\_bucket\_policies) | Additional IAM policies for the bucket | <pre>list(object({<br>    effect    = string<br>    actions   = list(string)<br>    resources = list(string)<br>  }))</pre> | `null` | no |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket.<br>Must be lowercase and less than or equal to 37 characters in length. | `string` | `null` | no |
| <a name="input_cors_rules"></a> [cors\_rules](#input\_cors\_rules) | Specifies the allowed headers, methods, origins and exposed headers when using CORS on this bucket | <pre>list(object({<br>    allowed_headers = list(string)<br>    allowed_methods = list(string)<br>    allowed_origins = list(string)<br>    expose_headers  = list(string)<br>    max_age_seconds = number<br>  }))</pre> | `null` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | A boolean that indicates all objects (including any locked objects) should be deleted<br>from the bucket so that the bucket can be destroyed without error. <br>These objects are not recoverable.<br>Valid values are true or false. | `bool` | `false` | no |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. | `bool` | `true` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The AWS KMS master key ARN used for the `SSE-KMS` encryption. This can only be used when you set <br>the value of `sse_algorithm` as `aws:kms`. The default aws/s3 AWS KMS master key is used if this element <br>is absent while the `sse_algorithm` is `aws:kms` | `string` | `""` | no |
| <a name="input_lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules) | A map that contains the lifecycle\_rule configuration. | `any` | `{}` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Bucket access logging configuration. | <pre>object({<br>    bucket_name = string<br>    prefix      = string<br>  })</pre> | `null` | no |
| <a name="input_object_lock_configuration"></a> [object\_lock\_configuration](#input\_object\_lock\_configuration) | A configuration for S3 object locking. With S3 Object Lock, you can store objects using a `write once, read many` (WORM) model.<br>Object Lock can help prevent objects from being deleted or overwritten for a fixed amount of time or indefinitely." | <pre>object({<br>    mode  = string # Valid values are GOVERNANCE and COMPLIANCE.<br>    days  = number<br>    years = number<br>  })</pre> | `null` | no |
| <a name="input_object_lock_enabled"></a> [object\_lock\_enabled](#input\_object\_lock\_enabled) | Indicates whether this bucket has an Object Lock configuration enabled.<br>Valid values are true or false. | `bool` | `false` | no |
| <a name="input_replication_configuration"></a> [replication\_configuration](#input\_replication\_configuration) | Map containing cross-region replication configuration. | `any` | `{}` | no |
| <a name="input_replication_policies"></a> [replication\_policies](#input\_replication\_policies) | Additional IAM policies for the bucket replication | <pre>list(object({<br>    effect    = string<br>    actions   = list(string)<br>    resources = list(string)<br>  }))</pre> | `null` | no |
| <a name="input_request_payer"></a> [request\_payer](#input\_request\_payer) | Specifies who pays for the download and request fees. Valid values: BucketOwner, Requester. | `string` | `null` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. | `bool` | `true` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | The server-side encryption algorithm to use. Valid values are `AES256` and `aws:kms` | `string` | `"aws:kms"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_versioning_status"></a> [versioning\_status](#input\_versioning\_status) | The versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. <br>Disabled should only be used when creating or importing resources that correspond <br>to unversioned S3 buckets. | `string` | `"Disabled"` | no |
| <a name="input_website"></a> [website](#input\_website) | Map containing static web-site hosting or redirect configuration. | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_accelerate_configuration_id"></a> [s3\_accelerate\_configuration\_id](#output\_s3\_accelerate\_configuration\_id) | The name of the bucket. |
| <a name="output_s3_acl_id"></a> [s3\_acl\_id](#output\_s3\_acl\_id) | The name of the bucket. |
| <a name="output_s3_arn"></a> [s3\_arn](#output\_s3\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |
| <a name="output_s3_bucket_domain_name"></a> [s3\_bucket\_domain\_name](#output\_s3\_bucket\_domain\_name) | The bucket domain name. Will be of format bucketname.s3.amazonaws.com. |
| <a name="output_s3_bucket_regional_domain_name"></a> [s3\_bucket\_regional\_domain\_name](#output\_s3\_bucket\_regional\_domain\_name) | The bucket region-specific domain name. |
| <a name="output_s3_encryption_id"></a> [s3\_encryption\_id](#output\_s3\_encryption\_id) | The name of the bucket. |
| <a name="output_s3_hosted_zone_id"></a> [s3\_hosted\_zone\_id](#output\_s3\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region. |
| <a name="output_s3_id"></a> [s3\_id](#output\_s3\_id) | The name of the bucket. |
| <a name="output_s3_object_lock_configuration_id"></a> [s3\_object\_lock\_configuration\_id](#output\_s3\_object\_lock\_configuration\_id) | The name of the bucket. |
| <a name="output_s3_region"></a> [s3\_region](#output\_s3\_region) | The AWS region this bucket resides in. |
| <a name="output_s3_versioning_id"></a> [s3\_versioning\_id](#output\_s3\_versioning\_id) | The name of the bucket. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
