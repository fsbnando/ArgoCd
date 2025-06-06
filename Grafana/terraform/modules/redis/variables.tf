variable "redis_availability_zones" {
  description = "Availability zone IDs"
  type = list(string)
}

variable "redis_vpc_id" {
	description = "VPC ID"
	type = string
}

variable "redis_associated_security_group_ids" {
	description = "A list of IDs of Security Groups to associate the created resource with"
	type = list(string)
}

variable "redis_subnets" {
  description = "Subnet IDs"
  type = list(string)
}

variable "redis_cluster_mode_enabled" {
	description = "Falg to enable/disable creation of a native redis cluster. 'automatic_failover_enabled' must be set to 'true'."
	type = bool
	default = true
}

variable "redis_cluster_mode_num_node_groups" {
	description = "Number of node groups (shards) for this Redis replication group. Changing this number will trigger an online resizing operation before other settings modifications"
	type = number
	default = 3
}

variable "redis_cluster_mode_replicas_per_node_group" {
	description = "Number of replica nodes in each node group. Valid values are 0 to 5. Changing this number will force a new resource"
	type = number
	default = 2
}

variable "redis_instance_type" {
  description = "Elastic cache instance type"
  type = string
  default = "cache.t4g.small"
}

variable "redis_family" {
  description = "value"
  type = string
  default = "redis6.x"
}

variable "redis_apply_immediately" {
	description = "Apply changes immediately"
	type = bool
	default = true
}

variable "redis_automatic_failover_enabled" {
	description = "Automatic failover (Not available for T1/T2 instances)"
	type = bool
	default = true
}

variable "redis_at_rest_encryption_enabled" {
	description = "Enable encryption at rest"
	type = bool
	default = false
}

variable "redis_transit_encryption_enabled" {
	description = "Set 'true' to enable encryption in transit. Reference: https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/in-transit-encryption.html#connect-tls"
	type = bool
	default = false
}

variable "redis_tags" {
  description = "Tags a serem colocadas nos recursos do Redis"
  type = map(string)
  default = {
    "name"        = "value",
    "description" = "value",
    "environment" = "value",
    "product"     = "value",
    "squad"       = "value",
    "cr"          = "-"
    "Managed-By"  = "Terraform"
  }
}

variable "redis_namespace" {
	description = "ID element. Usually an abbreviation of your organization name, e.g. 'eg' or 'cp', to help ensure generated IDs are globally unique"
	type = string
	default = ""
}

variable "redis_engine_version" {
  description = "Redis engine version"
  type = string
  default = "6.x"
}

variable "redis_snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  type = number
  default = 5
}

variable "redis_snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  type = string
  default = "04:00-06:00"
}

variable "redis_maintenance_window" {
  description = " Maintenance window (in UTC)"
  type = string
  default = "sun:00:00-sun:03:00"
  
}

variable "redis_multi_az_enabled" {
  description = "Multi AZ (Automatic Failover must also be enabled. If Cluster Mode is enabled, Multi AZ is on by default, and this setting is ignored)"
  type = bool
  default = true
}
