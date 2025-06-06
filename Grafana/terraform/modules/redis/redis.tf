module "redis" {
  # Source
  source = "cloudposse/elasticache-redis/aws"
  version = "0.44.0"

  #  Set to false to prevent the module from creating any resources
  enabled = true

  # Nome do redis
  name = var.redis_tags.Name

  # Namespace
  namespace = var.redis_namespace

  # VPC de criacao do redis
  vpc_id                     = var.redis_vpc_id

  # Zonas de disponibilidade (A & C)
  #availability_zones         = var.redis_availability_zones

  # Habilita multi-zona
  multi_az_enabled = var.redis_multi_az_enabled

  # Nao cria SecurityGroup para o recurso
  create_security_group = false

  # Reutiliza SecurityGroups ja existentes na conta e VPC
  associated_security_group_ids = var.redis_associated_security_group_ids

  # Define nome para grupo de subnet criado pelo elasticache
  #elasticache_subnet_group_name = var.redis_tags.Name

  # Define o numero de snapshots limite a serem guardadas
  snapshot_retention_limit = var.redis_snapshot_retention_limit

  # Define as subnets
  subnets                    = var.redis_subnets

  # Define o modo cluster
  cluster_mode_enabled       = var.redis_cluster_mode_enabled

  # Define o numero de maquinas
  cluster_mode_num_node_groups = var.redis_cluster_mode_num_node_groups

  # Define o numero de replicas por maquina
  cluster_mode_replicas_per_node_group = var.redis_cluster_mode_replicas_per_node_group

  # Define instancia a executar no cluster erdis
  instance_type              = var.redis_instance_type

  family = var.redis_family

  # Habilita a aplicacao automatica imediata das alteracoes
  apply_immediately          = var.redis_apply_immediately

  # Habilita o retorno automatico em caso de falha
  automatic_failover_enabled = var.redis_automatic_failover_enabled

  # Configura criptografia na api rest
  at_rest_encryption_enabled = var.redis_at_rest_encryption_enabled

  # Configura criptografia na
  transit_encryption_enabled = var.redis_transit_encryption_enabled

  # Tags para serem inseridas nos recursos do redis
  tags = var.redis_tags

  # Define versao do motor do redis
  engine_version = var.redis_engine_version

  # Define janela de manutencao
  maintenance_window = var.redis_maintenance_window

  # Define janela de captura de snapshots
  snapshot_window = var.redis_snapshot_window

}