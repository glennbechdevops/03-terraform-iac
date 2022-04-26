resource "aws_s3_bucket" "frontend" {
  bucket =  "glenn-demobucket"
  acl = "public-read"
  policy = <<EOF
{
  "Id": "bucket_policy_site",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "bucket_policy_site_main",
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::glenn-demobucket/*",
      "Principal": "*"
    }
  ]
}
EOF
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

variable "bucket_name" {
  description = "The name of the bucket to create"
  default = "<<bucket name here>>"
}