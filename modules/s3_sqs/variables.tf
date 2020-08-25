variable "bucket_arn" {
  type        = string
  description = "The ARN of the bucket to monitor"
}

variable "filter_prefix" {
  type        = string
  description = "Optional. The suffix that the s3 keys must match to trigger a notification. Leave blank if you want all items in the bucket to trigger notifications."
  default     = ""
}

variable "filter_suffix" {
  type        = string
  description = "Optional. The prefix that the s3 keys must match to trigger a notification. Leave blank if you want all items in the bucket to trigger notifications."
  default     = ""
}

variable "platform_instance_id" {
  type        = string
  description = "Unique identifier for this instance of the platform"
}

variable "queue_name" {
  type        = string
  description = "The name of the SQS queue to put the notifications into"
}

variable "region" {
  type        = string
  description = "AWS region to setup SQS"
}


