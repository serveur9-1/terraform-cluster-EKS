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

variable "private_subnets_ids" {
  description = "IDs des sous-réseaux privés"
  type        = list(string)
}

variable "public_subnets_ids" {
  description = "IDs des sous-réseaux publics"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID du groupe de sécurité"
  type        = string
}

variable "eks_iam_role_name" {
  description = "Nom du rôle IAM pour EKS"
  type        = string
  default     = "EKS_Students"
}

variable "eks_node_group" {
  description = "Nom du groupe de nœuds"
  type        = string
  default     = "eks-node-group"
}

variable "eks_iam_policies" {
  description = "Liste des politiques IAM à attacher au rôle EKS"
  type        = list(string)
  default     = [
    # Politique pour gérer le cluster EKS
    "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy",
    
    # Politique pour gérer les nœuds de travail dans le cluster
    "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
    
    # Politique pour permettre l'accès complet à VPC
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    
    # Politique pour permettre l'accès en lecture aux images dans Amazon ECR
    "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly",
    
    # Politique pour permettre la gestion du CNI d'EKS (réseau du cluster)
    "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
    
    # Politique permettant de décrire les instances EC2 et les groupes de sécurité (pour les nœuds)
    "arn:aws:iam::aws:policy/AmazonEC2DescribeInstances",
    
    # Politique permettant de décrire les VPC et les sous-réseaux
    "arn:aws:iam::aws:policy/AmazonVPCReadOnlyAccess"
  ]
}


variable "eks_addon_cni" {
  description = "Nom de l'addon CNI"
  type        = string
  default     = "vpc-cni"
}

variable "eks_addon_coredns" {
  description = "Nom de l'addon CoreDNS"
  type        = string
  default     = "coredns"
}

variable "eks_addon_kube_proxy" {
  description = "Nom de l'addon Kube Proxy"
  type        = string
  default     = "kube-proxy"
}

variable "alb_name" {
  description = "Nom du Load Balancer"
  type        = string
  default     = "eks-alb"
}

variable "instance_type" {
  description = "Type d'instance EC2"
  type        = string
  default     = "t2.micro"
}
