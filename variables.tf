variable "aws_region" {
  description = "La région AWS où sera déployé le cluster EKS"
  type        = string
  default     = "eu-west-3"
}

variable "vpc_name" {
  description = "Nom du VPC pour le cluster EKS"
  type        = string
  default     = "eks-vpc"
}

variable "private_subnets" {
  description = "Liste des sous-réseaux privés (AZ -> CIDR)"
  type        = map(string)
  default = {
    "eu-west-3a" = "10.0.4.0/24"
    "eu-west-3b" = "10.0.5.0/24"
    "eu-west-3c" = "10.0.6.0/24"
  }
}

variable "public_subnets" {
  description = "Liste des sous-réseaux publics (AZ -> CIDR)"
  type        = map(string)
  default = {
    "eu-west-3a" = "10.0.1.0/24"
    "eu-west-3b" = "10.0.2.0/24"
    "eu-west-3c" = "10.0.3.0/24"
  }
}

variable "eks_cluster_name" {
  description = "Nom du cluster EKS"
  type        = string
  default     = "eks-cluster"
}

variable "eks_cluster_version" {
  description = "Version du cluster EKS"
  type        = string
  default     = "1.32"
}

variable "eks_iam_role_name" {
  description = "Nom du rôle IAM pour EKS"
  type        = string
  default     = "EKS_Students"
}

variable "eks_iam_policies" {
  description = "Liste des politiques IAM à attacher au rôle EKS"
  type        = list(string)
  default     = [
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  ]
}
