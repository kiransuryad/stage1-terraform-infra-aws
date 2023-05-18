resource "random_id" "this" {
  byte_length = 2
}

resource "aws_s3_bucket" "bucket" {
  bucket = "s3-${var.environment}-${var.project}-${random_id.this.hex}"
  # acl    = var.acl  # deprecated

  tags = {
    Name        = "s3-${var.environment}-${var.project}-${random_id.this.hex}"
    Environment = var.environment
    Project     = var.project
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.bucket
  acl    = var.acl
}


resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "S3BucketManagement",
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteBucket",
                "s3:ListBucket",
                "s3:GetBucketAcl",
                "s3:GetBucketPolicy",
                "s3:PutBucketAcl",
                "s3:PutBucketPolicy"
            ],
            "Resource": "*"
        }
    ]
}
)
}
