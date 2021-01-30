resource "aws_eip" "lb" {
  vpc = true
}

output "eip" {
  value = aws_eip.lb.public_ip
}
resource "aws_s3_bucket" "mys3bucket" {
  bucket = "abhi-s3-bucket-demo"
}
output "mys3bucketOut" {
  value = aws_s3_bucket.mys3bucket.bucket_domain_name
}