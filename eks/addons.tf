resource "aws_eks_addon" "eks_addon_vpc-cni" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = var.eks_addon_cni
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"
}

resource "aws_eks_addon" "eks_addon_coredns" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = var.eks_addon_coredns
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"
  depends_on   = [aws_eks_addon.eks_addon_vpc-cni]
}

resource "aws_eks_addon" "eks_addon_kube_proxy" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = var.eks_addon_kube_proxy
  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"
  depends_on   = [aws_eks_addon.eks_addon_vpc-cni]
}
