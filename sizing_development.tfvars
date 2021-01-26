# Do not use this sizing. It is not suitable for production workloads. Development use only.
proxy_instance_type                    = "m5.large"
proxy_max_cluster_size                 = 2
proxy_min_cluster_size                 = 1
proxy_scale_down_thres                 = 250000000
proxy_scale_up_thres                   = 875000000
elasticache_instance_type              = "cache.m5.large"
rds_instance_size                      = "db.r5.large"
rds_instance_count                     = 1
elasticsearch_dedicated_master_enabled = false
elasticsearch_dedicated_master_count   = 0
elasticsearch_dedicated_master_type    = "m5.large.elasticsearch"
elasticsearch_instance_count           = 4
elasticsearch_instance_type            = "m5.large.elasticsearch"
elasticsearch_volume_size              = 50
ecs_instance_type                      = "m5.large"
ecs_max_cluster_size                   = 4
ecs_min_cluster_size                   = 1
ecs_volume_size                        = 50
services_instance_type                 = "m5.large"
services_max_cluster_size              = 2
services_min_cluster_size              = 1

faces_instance_type       = "m5.xlarge"
faces_max_cluster_size    = 4
faces_min_cluster_size    = 1
faces_rds_instance_size   = "db.r5.large"
faces_rds_instance_count  = 1
faces_rds_max_capacity    = 5
audio_instance_type       = "m5.large"
audio_max_cluster_size    = 4
audio_min_cluster_size    = 1
nld_instance_type         = "m5.large"
nld_max_cluster_size      = 4
nld_min_cluster_size      = 1
nlp_instance_type         = "m5.large"
nlp_max_cluster_size      = 4
nlp_min_cluster_size      = 1
object_instance_type      = "m5.large"
object_max_cluster_size   = 4
object_min_cluster_size   = 1
tcues_instance_type       = "m5.large"
tcues_max_cluster_size    = 4
tcues_min_cluster_size    = 1
vssoccer_instance_type    = "m5.large"
vssoccer_max_cluster_size = 4
vssoccer_min_cluster_size = 1
