# AWS Secrets Manager storage

This is a simple module to create secrets in AWS Secrets Manager.

## Usage

```hcl
provider "aws" {
  region = "us-east-1"
}

module "secrets_manager_storage" {
  source = "https://github.com/inaciogu/terraform-aws-secrets-manager-storage"

  secrets = [
    {
      name        = "example-secret"
      description = "Example secret created with terraform module"
      values = {
        example = "secret"
      }
    },
    {
      name        = "example-secret-2"
      description = "Example secret created with terraform module 2"
      values = {
        test = "test secret"
      }
    }
  ]
}
```