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

######

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