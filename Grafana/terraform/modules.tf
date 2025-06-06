
module "efs" {
  # Modulo local
  source = "./modules/efs"

  #################### Variaveis ####################
  # Tags dos recuros
  efs_tags = var.efs_tags

  # Zonas de disponibilidade dos pontos de montagem (looping nao deu bom)
  efs_availability_zones_id_a = var.efs_availability_zones_id_a
  efs_availability_zones_id_c = var.efs_availability_zones_id_c

  # Grupo de seguranca dos pontos de montagem
  efs_security_groups = var.efs_security_groups 

  # Tempo para mover conteudo para IA
  # Documentacao dessa variavel: https://docs.aws.amazon.com/efs/latest/ug/API_LifecyclePolicy.html
  efs_transition_to_ia = var.efs_transition_to_ia

  # Criptografia do disco
  efs_encrypted = var.efs_encrypted

  # Modo de performance do disco
  efs_performance_mode = var.efs_performance_mode

  # Modo de banda de dados do disco
  efs_throughput_mode = var.efs_throughput_mode

  # UID do ponto de acesso
  efs_ac_uid = var.efs_ac_uid

  # GID do ponto de acesso
  efs_ac_gid = var.efs_ac_gid

  # Permissao do FileSystem no ponto de acesso
  efs_ac_permissions = var.efs_ac_permissions

  # Caminho do FileSystem a ser considerado um ponto de acesso
  efs_ac_path = var.efs_ac_path
}

module "redis" {
  source = "./modules/redis"

  # Variaveis

  # VPC 
  redis_vpc_id                     = var.redis_vpc_id

  # Zonas de disponibilidade
  redis_availability_zones         = var.redis_availability_zones

  # SG a serem associados  
  redis_associated_security_group_ids = var.redis_associated_security_group_ids

  # Subnets de disponibilidade
  redis_subnets                    = var.redis_subnets

  # Habilitar o modo cluster
  redis_cluster_mode_enabled       = var.redis_cluster_mode_enabled

  # Grupo de nos no cluster
  redis_cluster_mode_num_node_groups = var.redis_cluster_mode_num_node_groups

  # Numero de shars por node
  redis_cluster_mode_replicas_per_node_group = var.redis_cluster_mode_replicas_per_node_group

  # Tipo de instancia a provisionar no nos do cluster
  redis_instance_type              = var.redis_instance_type

  #
  redis_apply_immediately          = var.redis_apply_immediately

  #
  redis_automatic_failover_enabled = var.redis_automatic_failover_enabled
  
  #
  redis_at_rest_encryption_enabled = var.redis_at_rest_encryption_enabled
  
  #
  redis_transit_encryption_enabled = var.redis_transit_encryption_enabled

  # Tags a inserir no recursos do redis
  redis_tags = var.redis_tags

}

 module "rds" {
  source = "./modules/rds"
  
  # Controla disco e quantidade de armazenamento de disco minimo e maximo (Expansivel)
  rds_storage_type          = var.rds_storage_type
  rds_allocated_storage     = var.rds_allocated_storage
  rds_max_allocated_storage = var.rds_max_allocated_storage

  # Controla o tipo de banco e a versao
  rds_engine               = var.rds_engine
  rds_engine_version       = var.rds_engine_version

  # Controla o tipo de maquina a executar o banco
  rds_instance_class       = var.rds_instance_class

  # Controla o nome do banco dentro do RDS
  rds_db_name              = var.rds_db_name
  # rds_identifier           = var.rds_tags.Name

  # Controla o usuario/senha de acesso ao banco
  rds_username             = var.rds_username
  rds_password             = var.rds_password

  # Habilita e controla as zonas de disponibilidade do banco
  rds_multi_az             = var.rds_multi_az
  # rds_availability_zone    = var.rds_availability_zone

  # Controla o acesso publico
  rds_publicly_accessible  = var.rds_publicly_accessible
  
  # Controla os auto-upgrades/updates de versao
  rds_auto_minor_version_upgrade  = var.rds_auto_minor_version_upgrade
  rds_allow_major_version_upgrade = var.rds_allow_major_version_upgrade

  # Define o SecurityGoup a ser inserido no banco
  rds_vpc_security_group_ids = var.rds_vpc_security_group_ids

  # Controle de backups e snapshots
  rds_copy_tags_to_snapshot = var.rds_copy_tags_to_snapshot
  rds_delete_automated_backups = var.rds_delete_automated_backups
  rds_skip_final_snapshot   = var.rds_skip_final_snapshot

  # Tags nos recursos
  rds_tags = var.rds_tags

  # Protecao contra delecao acidental
  rds_deletion_protection = var.rds_deletion_protection

  # Subnets a serem usadas pelo banco
  # rds_subnet_ids = var.rds_subnet_ids
}