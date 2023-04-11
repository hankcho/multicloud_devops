terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"  
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "cloudbootcamp-tobibike"  
}

# after I created the bucket, and manually added the jpeg file via AWS Management Console's S3 section
# i'm now going to make the bucket private (I chose it to be public when I uploaded the file initially)
resource "aws_s3_bucket_public_access_block" "s3_block" {
    bucket = aws_s3_bucket.s3_bucket.id  

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true 
}