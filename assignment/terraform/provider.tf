provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      version = "~> 3.46"
    }
  }
backend "s3"{
  bucket = "upgrad-tfstate-file"
  key = "terraform.tfstate"
  region = "us-east-1"
}
}
