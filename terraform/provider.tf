terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "ntcapp"
      ManagedBy   = "terraform"
      Repository  = "https://github.com/mfamari/ntcapp-project.git"
    }
  }
}