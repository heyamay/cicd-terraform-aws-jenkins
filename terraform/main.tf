provider "aws" {
  region = var.region
}

# Create EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-0163d2864ea753ee8"
  instance_type = "t2.micro"
  key_name      = "my-key"

  tags = {
    Name = "Jenkins-Deployment-Server"
  }
}

# Create an S3 Bucket
resource "aws_s3_bucket" "web_bucket" {
  bucket_prefix = "jenkins-terraform-demo-bucket"

  tags = {
    Name = "Jenkins-Terraform-S3"
  }
}

# Generate a Random ID for Unique S3 Bucket Name
resource "random_id" "bucket_id" {
  byte_length = 4
}

