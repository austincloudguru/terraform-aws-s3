provider "aws" {
  region = var.region
}

terraform {
  required_version = "~> 1.8.0"
  required_providers {
    aws = "~> 5.0"
  }
}

module "s3_bucket" {
  source                    = "../../"
  bucket                    = join("-", ["terratest", var.s3_suffix])
  force_destroy             = true
  object_lock_enabled       = var.object_lock_enabled
  object_lock_configuration = var.object_lock_configuration
  accelerate_configuration  = var.accelerate_configuration
  tags                      = var.tags
}
