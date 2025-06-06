output "redis_id" {
    description = "Retorna o ID do ElastiCache Redis criado"
    value = module.redis.id
}

output "redis_host" {
    description = "Retorna o Host do ElastiCache Redis criado"
    value = module.redis.host
}

output "redis_port" {
    description = "Retorna a Porta do ElastiCache Redis criado"
    value = module.redis.port
}

output "redis_endpoint" {
    description = "Retorna o endpoint do ElastiCache Redis criado"
    value = module.redis.endpoint
}

