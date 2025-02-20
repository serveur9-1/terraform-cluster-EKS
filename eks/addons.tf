resource "aws_eks_addon" "eks_addon_vpc-cni" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = var.eks_addon_cni
  depends_on   = [aws_eks_cluster.eks_cluster]
}

resource "aws_eks_addon" "eks_addon_coredns" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = var.eks_addon_coredns
  depends_on   = [aws_eks_cluster.eks_cluster]
}

resource "aws_eks_addon" "eks_addon_kube_proxy" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  addon_name   = var.eks_addon_kube_proxy
  depends_on   = [aws_eks_cluster.eks_cluster]
}
