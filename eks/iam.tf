resource "aws_iam_role" "eks_role" {
  name = var.eks_iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
        Effect = "Allow"
        Principal = {
          Service = ["eks.amazonaws.com", "ec2.amazonaws.com"]
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_policies" {
  for_each   = toset(var.eks_iam_policies)
  policy_arn = each.value
  role       = aws_iam_role.eks_role.name
}

