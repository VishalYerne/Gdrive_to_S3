provider "aws" {
  region = var.aws_region
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Production"
  }
}

# Upload files from the local 'google_drive_data' directory to S3
resource "aws_s3_object" "upload_files" {
  for_each = fileset("${path.module}/google_drive_data", "*")

  bucket       = aws_s3_bucket.my_bucket.id
  key          = each.value
  source       = "${path.module}/google_drive_data/${each.value}"
  content_type = "application/octet-stream"
}
