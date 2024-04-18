package test

import (
	"math/rand"
	"strconv"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesTerraform(t *testing.T) {
	t.Parallel()

	rand.Seed(time.Now().UnixNano())

	randId := strconv.Itoa(rand.Intn(100000))
	expectedS3Arn := "arn:aws:s3:::terratest-" + randId

	terraformOpts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/terratest/",
		VarFiles: []string{"terratest.tfvars"},
		Vars: map[string]interface{}{
			"s3_suffix": randId,
		},
	})

	defer terraform.Destroy(t, terraformOpts)
	terraform.InitAndApply(t, terraformOpts)

	// Set the variables from the tfvars file
	ObjectLockEnabled := terraform.GetVariableAsStringFromVarFile(t, "../examples/terratest/terratest.tfvars", "object_lock_enabled")
	
	// Run `terraform output` to get the value of an output variable
	s3Arn := terraform.Output(t, terraformOpts, "s3_arn")
	s3Id := terraform.Output(t, terraformOpts, "s3_id")
	s3ObjectLockConfigurationId := terraform.Output(t, terraformOpts, "s3_object_lock_configuration_id")
	s3AccelerateConfigurationId := terraform.Output(t, terraformOpts, "s3_accelerate_configuration_id")
	s3VersioningId := terraform.Output(t, terraformOpts, "s3_versioning_id")
	s3EncryptionId := terraform.Output(t, terraformOpts, "s3_encryption_id")

	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedS3Arn, s3Arn)
	if ObjectLockEnabled == "true" {
		assert.Equal(t, s3ObjectLockConfigurationId, s3Id)
	}
	assert.Equal(t, s3AccelerateConfigurationId, s3Id)

	if s3VersioningId != "" {
		assert.Equal(t, s3VersioningId, s3Id)
	}
	assert.Equal(t, s3EncryptionId, s3Id)

}
