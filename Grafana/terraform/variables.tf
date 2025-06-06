#################################################################################################
# Provider
#################################################################################################
variable "workspace_iam_roles" {
  description = "ARNs das roles que podem ser utilizadas pra criação da estrutura do EFS em outras contas na AWS. Cada conta que for utilizada deverá ser configurada numa workspace separada."
  default = {
    vrprd = "arn:aws:iam::922894635329:role/AtlantisServiceRole" // SSO
    vrdev = "arn:aws:iam::404224439755:role/AtlantisServiceRole" // SSO
  }
}

variable "workspace_iam_region" {
  description = "Informa a região correta para ser utilizada no profile de cada workspace"
  default = {
    vrprd = "sa-east-1"
    vrdev = "us-east-2"
  }
}

#################################################################################################
# Modulo: EFS
#################################################################################################
variable "efs_tags" {
  description = "Tags a serem colocadas nos recursos do disco EFS"
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

# Documentacao do modulo:
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system#throughput_mode
variable "efs_availability_zones_id_a" {
  description = "Zonas de disponibilidade para se criar o ponto de montagem"
  type        = string
}

variable "efs_availability_zones_id_c" {
  description = "Zonas de disponibilidade para se criar o ponto de montagem"
  type        = string
}

variable "efs_security_groups" {
  description = "Grupo de seguranca a ser colocado no ponto de montagem"
  type        = list
  default     = []
}

# Documentacao dessa variavel (consulte para valores aceitos)
# https://docs.aws.amazon.com/efs/latest/ug/API_LifecyclePolicy.html
variable "efs_transition_to_ia" {
  description = "Describes the period of time that a file is not accessed, after which it transitions to IA storage. Default: 'AFTER_7_DAYS'."
  type        = string
  default     = "AFTER_7_DAYS"
}

variable "efs_encrypted" {
  description = "If true, the disk will be encrypted."
  type        = bool
  default     = false
}

variable "efs_performance_mode" {
  description = "The file system performance mode. Can be either 'generalPurpose' or 'maxIO' (Default: 'generalPurpose')."
  type        = string
  default     = "generalPurpose"
}

variable "efs_throughput_mode" {
  description = "Throughput mode for the file system. Defaults to [bursting]. Valid values: bursting, provisioned."
  type        = string
  default     = "bursting"
}

variable "efs_ac_uid" {
  description = "UID do usuario do ponto de acesso"
  type = string
}

variable "efs_ac_gid" {
  description = "GID do usuario do ponto de acesso"
  type = string
}

variable "efs_ac_permissions" {
  description = "Nivel de permissisao no sistema de arquvos"
  type = string
  default = "0777"
}

variable "efs_ac_path" {
  description = "Caminho do ponto de acesso. Padrao: / "
  type = string
  default = "/"
}

#################################################################################################
# Modulo: Redis
#################################################################################################
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
  default = "6.2"
}

variable "redis_snapshot_retention_limit" {
  description = "The number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them."
  type = number
  default = 5
}

variable "redis_snapshot_window" {
  description = "The daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster."
  type = string
  default = "00:00-02:00"
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

#################################################################################################
# Modulo: RDS
#################################################################################################
variable "rds_allocated_storage" {
  description = "The allocated storage in Gigabytes"
  type = number
  default = 20
}

variable "rds_max_allocated_storage" {
  description = "value"
  type = number
  default = 1000
}

variable "rds_engine" {
  description = "The database engine to use. For supported values, see the Engine parameter in: https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html"
  type = string
  default = "postgresql"
}

variable "rds_engine_version" {
  description = "(Optional) The engine version to use. If auto_minor_version_upgrade is enabled, you can provide a prefix of the version such as 5.7 (for 5.7.10)."
  type = string
}

variable "rds_instance_class" {
  description = "(Required) The instance type of the RDS instance."
  type = string
}

variable "rds_db_name" {
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance"
  type = string
}

variable "rds_backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica."
  type = number
  default = 7
}

variable "rds_tags" {
  description = "A map of tags to assign to the resource."
  type = map(string)
}

variable "rds_skip_final_snapshot" {
  description = "Determines whether a final DB snapshot is created before the DB instance is deleted."
  type = bool
  default = true
}

variable "rds_publicly_accessible" {
  description = "Bool to control if instance is publicly accessible."
  type = bool
  default = false
}

variable "rds_storage_type" {
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD)."
  type = string
  default = "gp2"
}

variable "rds_multi_az" {
  description = "If the RDS instance is multi AZ enabled."
  type = bool
  default = true
}

variable "rds_vpc_security_group_ids" {
  description = "List of VPC security groups to associate."
  type = list(string)
}

variable "rds_allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  type = bool
  default = true
}

variable "rds_auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  type = bool
  default = true
}

variable "rds_copy_tags_to_snapshot" {
  description = "Copy all Instance tags to snapshots."
  type = bool
  default = true
}

variable "rds_delete_automated_backups" {
  description = "Specifies whether to remove automated backups immediately after the DB instance is deleted"
  type = bool
  default = true
}

variable "rds_deletion_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
  type = bool
  default = true
}

variable "rds_maintenance_window" {
  description = "The window to perform maintenance in. Syntax: 'ddd:hh24:mi-ddd:hh24:mi'."
  type = string
  default = "sun:00:00-sun:05:00"
}

variable "rds_username" {
  description = "Username for the master DB user. Cannot be specified for a replica."
  type = string
}

variable "rds_password" {
  description = "Password for the master DB user. Note that this may show up in logs, and it will be stored in the state file."
  type = string
}

# variable "rds_subnet_ids" {
#   description = "A list of VPC subnet IDs."
#   type = list(string)
# }

# variable "rds_availability_zone" {
#   description = "The availability zone of the instance"
#   type = list(string)
# }