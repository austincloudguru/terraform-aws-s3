variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-west-2"
}

variable "s3_suffix" {
  description = "Suffix for the key to allow for multiple runs"
  type        = string
  default     = "123456"
}

variable "tags" {}
variable "object_lock_enabled" {}
variable "object_lock_configuration" {}
variable "accelerate_configuration" {}
