# Module Core Compute (VPC, Subnets, etc.)
module "core-compute" {
  source = "./modules/core-compute"

  vpc_name        = var.vpc_name
  private_subnets = values(var.private_subnets)
  public_subnets  = values(var.public_subnets)
}

# Module EKS (Cluster, Nodes, Add-ons, etc.)
module "eks" {
  source               = "./eks"
  private_subnets_ids  = module.core-compute.private_subnets_ids
  public_subnets_ids   = module.core-compute.public_subnets_ids
  security_group_id    = module.core-compute.security_group_id
  eks_cluster_name     = var.eks_cluster_name
  eks_cluster_version  = var.eks_cluster_version
  eks_iam_role_name    = var.eks_iam_role_name
  eks_iam_policies     = var.eks_iam_policies
}