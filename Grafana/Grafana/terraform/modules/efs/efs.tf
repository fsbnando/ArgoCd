###
resource "aws_efs_file_system" "efs" {
  # Nome unico
  creation_token = var.efs_tags.Name

  # Modo de operacao
  performance_mode       = var.efs_performance_mode
  throughput_mode        = var.efs_throughput_mode

  # Criptografia
  encrypted = var.efs_encrypted

  # Infrequent Access (unico valor aceito)
  lifecycle_policy {
    transition_to_ia = var.efs_transition_to_ia 
  }

  lifecycle_policy {
    transition_to_primary_storage_class = "AFTER_1_ACCESS"
  }

  # Tags
  tags = var.efs_tags
}

# Zona A
# PS: Necessario pois o looping da zona nao e possivel
resource "aws_efs_mount_target" "efs-mount-a" {
  # ID do recurso anterior
  file_system_id  = aws_efs_file_system.efs.id

  # Define a subnet da criacao do ponto de montagem
  subnet_id       = var.efs_availability_zones_id_a

  # Define o security-group a ser colocado
  security_groups = var.efs_security_groups
}

# Zona C
# PS: Necessario pois o looping da zona nao e possivel
resource "aws_efs_mount_target" "efs-mount-c" {
  # ID do recurso anterior
  file_system_id  = aws_efs_file_system.efs.id

  # Define a subnet da criacao do ponto de montagem
  subnet_id       = var.efs_availability_zones_id_c

  # Define o security-group a ser colocado
  security_groups = var.efs_security_groups
}

# Cria AC de acesso generalizado
resource "aws_efs_access_point" "efs-ac" {
  # ID do recurso anterior
  file_system_id  = aws_efs_file_system.efs.id

  posix_user {
    uid = var.efs_ac_uid
    gid = var.efs_ac_gid
  }

  root_directory {
    path = var.efs_ac_path
    creation_info {
      owner_uid   = var.efs_ac_uid
      owner_gid   = var.efs_ac_gid
      permissions = var.efs_ac_permissions
    }
  }

  # Tags
  tags = var.efs_tags
}