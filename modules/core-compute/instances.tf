resource "aws_instance" "instance-1" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnets[0].id 
  security_groups = [aws_security_group.eks_sg.id]
  tags = {
    Name = "instance-1"
  }
}
