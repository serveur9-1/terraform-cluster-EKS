# Table de routage publique
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks-public-route-table"
  }
}

# Route vers Internet pour les sous-réseaux publics
resource "aws_route" "public_internet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.eks_igw.id
}

# Associations des sous-réseaux publics
resource "aws_route_table_association" "public_subnets" {
  for_each = { for k, subnet in aws_subnet.public_subnets : k => subnet.id }

  subnet_id      = each.value
  route_table_id = aws_route_table.public_route_table.id
}

# Table de routage privée
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = {
    Name = "eks-private-route-table"
  }
}

# Route NAT pour les sous-réseaux privés
resource "aws_route" "private_nat_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}

# Associations des sous-réseaux privés
resource "aws_route_table_association" "private_subnets_1" {
  for_each = { for k, subnet in aws_subnet.private_subnets : k => subnet.id }

  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table.id
}

# Associations des sous-réseaux privés - 2ème ressource renommée (après modifications)
resource "aws_route_table_association" "private_subnets_2" {
  for_each = { for k, subnet in aws_subnet.private_subnets : k => subnet.id }

  subnet_id      = each.value
  route_table_id = aws_route_table.private_route_table.id
}
