resource "aws_vpc" "eks_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "eks_vpc"
  }
}

# Sous-réseaux privés
resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnets

  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name = "eks-private-${each.key}"
  }
}

# Sous-réseaux publics
resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    Name = "eks-public-${each.key}"
  }
}
