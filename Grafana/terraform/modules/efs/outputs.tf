##### Exibe ID do EFS para criação no chart
#
output "efs_id" {
    description = "Retorna o ID do disco EFS Criado"
    value       = aws_efs_file_system.efs.id
}