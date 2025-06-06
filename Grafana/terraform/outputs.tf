output "efs_id" {
    description = "Retorna o ID do EFS criado"
    value = module.efs.efs_id
}

output "redis_endpoint" {
    description = "Retorna o Endpoint do ElastiCache Redis criado"
    value = module.redis.redis_endpoint
}

output "redis_port" {
    description = "Retorna a Porta do ElastiCache Redis criado"
    value = module.redis.redis_port
}

output "rds_endpoint" {
    description = "Retorna o Endpoint de conexao ao banco RDS."
    value = module.rds.rds_endpoint
}

output "rds_db_name" {
    description = "Retorna o Database-Name do banco RDS."
    value = module.rds.rds_db_name
}