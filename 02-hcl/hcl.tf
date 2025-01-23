terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "5.37.0"
        }
    }
}

# Actively Managed by Us
resource "aws_s3_bucket" "my_bucket" {
    bucket = var.my_var
}

# Managed somewhere else, we just want to use in our project
data "aws_s3_bucket" "my_external_bucket" {
    bucket = "not-managed-by-us"
}

variable "my_var" {
    type = string
    description = "My variable used to set bucket name"
    default = "my_var_default_value"
}

output "bucket_id" {
    value = aws_s3_bucket.my_bucket.id
}

locals {
    my_local = "my_local_value"
} 