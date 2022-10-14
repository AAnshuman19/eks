terraform {
  backend "s3" {
      bucket  = "terraform-tf-state-anshuman"
      key     = "terraform/state/pgsql"
      region  = "ap-south-1"

  }
      
}