output "eks_cluster_name" {
  description = "Nom du cluster EKS"
  value       = aws_eks_cluster.eks_cluster.name
}

output "eks_cluster_endpoint" {
  description = "Endpoint API du cluster EKS"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "load_balancer_dns" {
  description = "DNS du Load Balancer"
  value       = aws_lb.eks_alb.dns_name
}
