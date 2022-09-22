object_lock_enabled = true
tags = {
  fp-component          = "Terratest"
  fp-owner              = "mark.honomichl@forcepoint.com"
  fp-product            = "security"
  fp-dataclassification = "private"
  terraform             = "true"
}

object_lock_configuration = {
  mode  = "COMPLIANCE"
  days  = 7
  years = null
}

accelerate_configuration = "Enabled"
