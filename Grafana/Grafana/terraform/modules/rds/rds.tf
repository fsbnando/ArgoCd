#
resource "aws_db_instance" "database" {
  # Controla disco e quantidade de armazenamento de disco minimo e maximo (Expansivel)
  storage_type          = var.rds_storage_type
  allocated_storage     = var.rds_allocated_storage
  max_allocated_storage = var.rds_max_allocated_storage

  # Controla o tipo de banco e a versao
  engine               = var.rds_engine
  engine_version       = var.rds_engine_version

  # Controla o tipo de maquina a executar o banco
  instance_class       = var.rds_instance_class

  # Controla o nome do banco
  db_name              = var.rds_db_name
  identifier           = var.rds_tags.Name

  # Controla o usuario/senha de acesso ao banco
  username             = var.rds_username
  password             = var.rds_password

  # Habilita e controla as zonas de disponibilidade do banco
  multi_az             = var.rds_multi_az
  # availability_zone    = var.rds_availability_zone

  # Controla o acesso publico
  publicly_accessible  = var.rds_publicly_accessible
  
  # Controla os auto-upgrades/updates de versao
  auto_minor_version_upgrade  = var.rds_auto_minor_version_upgrade
  allow_major_version_upgrade = var.rds_allow_major_version_upgrade

  # Define o SecurityGoup a ser inserido no banco
  vpc_security_group_ids = var.rds_vpc_security_group_ids

  # Controle de backups e snapshots
  copy_tags_to_snapshot = var.rds_copy_tags_to_snapshot
  delete_automated_backups = var.rds_delete_automated_backups
  skip_final_snapshot   = var.rds_skip_final_snapshot
  backup_retention_period = var.rds_backup_retention_period

  # Tags nos recursos
  tags = var.rds_tags

  # Protecao contra delecao acidental
  deletion_protection = var.rds_deletion_protection

  # Define grupo de subnets a usar
  # db_subnet_group_name = aws_db_subnet_group.subnets.id

  # Adiciona dependencia ao recurso de grupo de subnet
  # depends_on = [aws_db_subnet_group.subnets]
}

# resource "aws_db_subnet_group" "subnets" {
#   # Nome do grupo
#   name = var.rds_tags.Name

#   # Descricao do grupo
#   description = var.rds_tags.Description

#   # Define as subnets a serem usadas
#   subnet_ids = var.rds_subnet_ids

#   # Tags nos recursos
#   tags = var.rds_tags
# }