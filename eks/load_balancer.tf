resource "aws_lb" "eks_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnets_ids
  tags = {
    Name = "eks-alb"
  } 
}
