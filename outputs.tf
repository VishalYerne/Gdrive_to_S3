output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.id
}

output "s3_bucket_url" {
  value = "https://${aws_s3_bucket.my_bucket.id}.s3.amazonaws.com/"
}
