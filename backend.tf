#backend.tf

terraform {
  backend "s3" {
    bucket         = "terraform-state-822175216351"
    key            = "terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}