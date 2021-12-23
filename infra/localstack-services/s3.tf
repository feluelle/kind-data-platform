resource "aws_s3_bucket" "s3" {
  bucket_prefix = "data-lake-"
}

output "data-lake-s3-bucket" {
  value = aws_s3_bucket.s3.id
}
