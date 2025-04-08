terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.93.0"
    }
  }
  backend "s3" {
    bucket         = "terraform-state-bucket-29"
    key            = "basic-setup-infra-1"
    region         = "us-east-1"
    dynamodb_table = "Terraform-locking"
  }
}


provider "aws" {
  # Configuration options
  region = "us-east-1"
} 