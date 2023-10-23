provider "aws" {
  region = "us-east-1"
}

module "secrets_manager_storage" {
  source = "../"

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
