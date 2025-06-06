output "rds_endpoint" {
    description = "Retorna o Endpoint de conexao ao banco RDS."
    value = aws_db_instance.database.endpoint
}

output "rds_db_name" {
    description = "Retorna o Database-Name do banco RDS."
    value = aws_db_instance.database.db_name
}