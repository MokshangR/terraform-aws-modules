#handles terraform version constraints, backend configuration (where the state file is stored), and provider requirements

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.11.0"
    }
  }
}