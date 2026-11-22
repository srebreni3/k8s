output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "rds_endpoint" { value = aws_db_instance.cve.address }
output "ecr_urls" { value = { for k, r in aws_ecr_repository.app : k => r.repository_url } }