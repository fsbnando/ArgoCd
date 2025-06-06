#################################################################################################
# General
#################################################################################################
#

# TODO
# Validar variaveis genericas e unificar variaveis

###########

#################################################################################################
# RDS
#################################################################################################
#
# Controla disco e quantidade de armazenamento de disco minimo e maximo (Expansivel)
rds_storage_type          = "gp2"
rds_allocated_storage     = 50
rds_max_allocated_storage = 1000

# Controla o tipo de banco e a versao
rds_engine               = "postgres"
rds_engine_version       = "14.2"

# Controla o tipo de maquina a executar o banco
rds_instance_class       = "db.t4g.small"

# Controla o usuario/senha/banco de acesso ao RDS
rds_username             = "grafana"
rds_db_name              = "grafanadb"

# Habilita e controla as zonas de disponibilidade do banco (Habilitar na proxima versao)
rds_multi_az             = true

# Controla o acesso publico
rds_publicly_accessible  = false

# Controla os auto-upgrades/updates de versao
rds_auto_minor_version_upgrade  = true
rds_allow_major_version_upgrade = true

# Define o SecurityGoup a ser inserido no banco (VR-OFFICE e VR-INTERNET)
rds_vpc_security_group_ids = ["sg-38a2115e", "sg-afae2cc9"]

# Controle de backups e snapshots
rds_copy_tags_to_snapshot = true
rds_delete_automated_backups = true
rds_skip_final_snapshot   = false

# Define horario manutencao de segunda feira
rds_backup_retention_period = 7
rds_maintenance_window = "mon:01:00-mon:02:00"

# Tags nos recursos
rds_tags = {
  "Name"        = "grafana-8",
  "Description" = "RDS do Grafana 8.x.x no cluster kubernetes de infraestrutura",
  "Environment" = "Production",
  "Product"     = "Grafana",
  "Squad"       = "Devtools",
  "CR"          = "-"
  "Managed-By"  = "Terraform"
}

# Protecao contra delecao acidental
rds_deletion_protection = true

#################################################################################################
# Redis
#################################################################################################
#
# Namespace
redis_namespace = "vr"

# SG: vpc-default e VR-OFFICE
redis_associated_security_group_ids = ["sg-dfdf7ab9", "sg-afae2cc9"]

# VPC: VRPRD
redis_vpc_id = "vpc-d9b57fbe"

# Zonas de disponibilidiade (A e C)
redis_availability_zones = ["sa-east-1a", "sa-east-1c"]

# Subnet: private-db (private-db-a & private-db-c)
redis_subnets = ["subnet-84357fe3", "subnet-586f4a00"]

# Modo cluster
redis_cluster_mode_enabled = true
redis_cluster_mode_num_node_groups = 3
redis_cluster_mode_replicas_per_node_group = 2

# Tipo de instancia
redis_instance_type = "cache.t4g.small"

# Auto aplicar de imediato
redis_apply_immediately = true

# Rollback em caso de erros
redis_automatic_failover_enabled = true

# Consultar UI da console AWS para as versoes
redis_engine_version = "6.2"

# Tags
redis_tags = {
    "Name"        = "grafana-8",
    "Description" = "Redis do Grafana 8.x.x no cluster kubernetes de infraestrutura",
    "Environment" = "Production",
    "Product"     = "Grafana",
    "Squad"       = "Devtools",
    "CR"          = "-"
    "Managed-By"  = "Terraform"
}

#################################################################################################
# EFS
#################################################################################################
# Tags a serem colocadas nos recursos do disco EFS
efs_tags = {
    "Name"        = "grafana-app",
    "Description" = "Disco do Grafana 8.x.x no cluster kubernetes de infraestrutura",
    "Environment" = "Production",
    "Product"     = "Grafana",
    "Squad"       = "Devtools",
    "CR"          = "-"
    "Managed-By"  = "Terraform"
}

# Zonas de disponibilidade para se criar o ponto de montagem
efs_availability_zones_id_a = "subnet-ec307a8b"
efs_availability_zones_id_c = "subnet-0b6f4a53"

# Grupo de seguranca a ser colocado no ponto de montagem (padrao: "aws-efs")
efs_security_groups = ["sg-02fe14453cedb6246"]

# Define o periodo que os dados sao movidos para o armazenamento IA
# Documentacao dessa variavel: https://docs.aws.amazon.com/efs/latest/ug/API_LifecyclePolicy.html
efs_transition_to_ia = "AFTER_7_DAYS"

# Se true, entao disco sera criptografado
efs_encrypted = false

# Tipo de modo de performance do disco EFS. Valores aceitos: 'generalPurpose' ou 'maxIO'.
efs_performance_mode = "generalPurpose"

# Throughput mode for the file system. Defaults to [bursting]. Valid values: bursting, provisioned.
# Modo de Taxa de transferência pro disco EFS. Valores aceitos: 'bursting' ou 'provisioned'.
efs_throughput_mode = "bursting"

# Configuracoes do ponto de acesso do disco EFS
# Define usuario via UID
efs_ac_uid = 472
# Define grupo via GID
efs_ac_gid = 472
# Define ponto de acesso do disco
efs_ac_path = "/"
# Define permissoes de SO no ponto de acesso (recursivo)
efs_ac_permissions = "0777"
