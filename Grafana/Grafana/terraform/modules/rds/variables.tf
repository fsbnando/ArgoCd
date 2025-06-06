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

variable "rds_backup_retention_period" {
  description = "The days to retain backups for. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica."
  type = number
  default = 7
}

# variable "rds_subnet_ids" {
#   description = "A list of VPC subnet IDs."
#   type = list(string)
# }

# variable "rds_availability_zone" {
#   description = "The availability zone of the instance"
#   type = list(string)
# }