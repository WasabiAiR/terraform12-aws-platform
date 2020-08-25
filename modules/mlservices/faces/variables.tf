variable "instance_type" { type = string }
variable "key_name" { type = string }
variable "max_cluster_size" { type = string }
variable "min_cluster_size" { type = string }
variable "mlservices_alb_dns" { type = string }
variable "mlservices_ami_id" { type = string }
variable "mlservices_iam_instance_profile" { type = string }
variable "mlservices_nsg" { type = string }
variable "mlservices_subnet_id_1" { type = string }
variable "mlservices_subnet_id_2" { type = string }
variable "platform_instance_id" { type = string }
variable "proxy_endpoint" { type = string }
variable "rds_database_name" { type = string }
variable "rds_db_password" { type = string }
variable "rds_db_username" { type = string }
variable "rds_endpoint" { type = string }
variable "rds_ro_endpoint" { type = string }
variable "target_group_mlservices_arn" { type = string }
variable "user_init" { type = string }
variable "volume_size" { type = string }


