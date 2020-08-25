locals {
  api_name  = "faces"
  api_port  = "10302"
  data_port = "12302"
  tfs_port  = "11302"
}

# Generate the cloud-init script
data "template_file" "userdata" {
  template = file("${path.module}/userdata.tpl")

  vars = {
    api_port          = local.api_port
    dataversion       = "1"
    data_port         = local.data_port
    log_group         = var.ml_loadbalancer_output["ml_cloudwatch_log_group"]
    postgresdb        = "faces"
    postgresendpoint  = element(split(":", "${aws_rds_cluster.postgresql.endpoint}"), 0)
    postgresrendpoint = element(split(":", "${aws_rds_cluster.postgresql.reader_endpoint}"), 0)
    postgrespass      = var.rds_db_password
    postgresport      = "5432"
    postgresuser      = var.rds_db_username
    proxy_endpoint    = var.ml_loadbalancer_output["proxy_endpoint"]
    tfs_port          = local.tfs_port
  }
}

# Create the cluster
module "cluster" {
  source = "../ml_cluster"

  cloud_init                      = data.template_file.userdata.rendered
  instance_type                   = var.instance_type
  key_name                        = var.key_name
  max_cluster_size                = var.max_cluster_size
  min_cluster_size                = var.min_cluster_size
  mlservices_alb_dns              = var.mlservices_alb_dns
  mlservices_ami_id               = var.mlservices_ami_id
  mlservices_iam_instance_profile = var.mlservices_iam_instance_profile
  mlservices_nsg                  = var.mlservices_nsg
  mlservices_subnet_id_1          = var.mlservices_subnet_id_1
  mlservices_subnet_id_2          = var.mlservices_subnet_id_2
  platform_instance_id            = var.platform_instance_id
  port                            = local.api_port
  service_name                    = local.api_name
  target_group_mlservices_arn     = var.target_group_mlservices_arn
  user_init                       = var.user_init
  volume_size                     = var.volume_size
}
