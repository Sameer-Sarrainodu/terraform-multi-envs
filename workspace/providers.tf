terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
  backend "s3" {
    bucket="sam-bucket-84s"
    region="us-east-1"
    key="workspace-demo"
        encrypt        = true
    use_lockfile   = true
  }
}


provider "aws" {
  region = var.aws_reg # Change this to your region
}


