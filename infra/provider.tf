terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {

  # access_key = "AKIAW3MEAPRWVP6Y2KA3"
  # secret_key = "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"
  region = "us-east-1"
}
