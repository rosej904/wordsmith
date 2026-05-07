terraform {
  backend "s3" {
    bucket = "jr-lab-tf-state"             # The bucket you created manually
    key    = "exercises/s3-new/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "exercise_bucket" {
  bucket = "jr-exercise-bucket-unique-id" # Must be globally unique
  
  tags = {
    Environment = "Lab"
    ManagedBy   = "ArgoWorkflows"
  }
}