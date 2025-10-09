terraform {
  backend "s3" {
    bucket       = "w7-ma-terraform-bucket"
    key          = "week10project/terraform.tfstate"
    region       = "us-east-1"
   
  }
}