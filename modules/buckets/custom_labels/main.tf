resource "aws_s3_bucket" "custom_labels_s3_bucket" {
  bucket = var.bucket_name
  region = var.region

  policy = data.aws_iam_policy_document.bucket.json

  lifecycle {
    prevent_destroy = false
  }

  # tags = {
  #   ApplicationName    = "Curio"
  #   PlatformInstanceID = "${var.platform_instance_id}"
  # }
}

resource "aws_s3_bucket_public_access_block" "custom_labels_s3_bucket" {
  bucket                  = aws_s3_bucket.custom_labels_s3_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "bucket" {
  statement {
    sid = "1"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["rekognition.amazonaws.com"]
    }

    actions = [
      "s3:GetBucketAcl",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}",
    ]
  }

  statement {
    sid = "2"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["rekognition.amazonaws.com"]
    }

    actions = [
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectVersion",
      "s3:GetObjectTagging",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
    ]
  }

  statement {
    sid = "3"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["rekognition.amazonaws.com"]
    }

    actions = [
      "s3:PutObject",
    ]

    resources = [
      "arn:aws:s3:::${var.bucket_name}/*",
    ]

    condition {
      test     = "StringEquals"
      variable = "s3:x-amz-acl"

      values = [
        "bucket-owner-full-control",
      ]
    }
  }
}
