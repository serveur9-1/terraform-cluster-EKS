output "vpc_id" {
  description = "ID du VPC créé"
  value       = aws_vpc.eks_vpc.id
}

output "private_subnets_ids" {
  description = "Liste des IDs des sous-réseaux privés"
  value       = [for subnet in aws_subnet.private_subnets : subnet.id]
}

output "public_subnets_ids" {
  description = "Liste des IDs des sous-réseaux publics"
  value       = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "security_group_id" {
  description = "ID du groupe de sécurité associé au VPC"
  value       = aws_vpc.eks_vpc.default_security_group_id
}

output "internet_gateway_id" {
  description = "ID de l'Internet Gateway"
  value       = aws_internet_gateway.eks_igw.id
}

output "nat_gateway_id" {
  description = "ID du NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}
