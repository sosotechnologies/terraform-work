# Define new IAM users
resource "aws_iam_user" "macaz5" {
  name = "macaz5@gmail.com"
}

resource "aws_iam_user" "macaz6" {
  name = "macaz6@gmail.com"
}

resource "aws_iam_user" "macaz7" {
  name = "macaz7@gmail.com"
}

resource "aws_iam_user" "macaz8" {
  name = "macaz8@gmail.com"
}

# Define group memberships for new users
resource "aws_iam_user_group_membership" "macaz5_groups" {
  user = aws_iam_user.macaz5.name

  groups = [
    aws_iam_group.eks_admin_console.name,
  ]
}

resource "aws_iam_user_group_membership" "macaz6_groups" {
  user = aws_iam_user.macaz6.name

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name,
    aws_iam_group.frontend_developer_group_two.name,
  ]
}

resource "aws_iam_user_group_membership" "macaz7_groups" {
  user = aws_iam_user.macaz7.name

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name,
  ]
}

resource "aws_iam_user_group_membership" "macaz8_groups" {
  user = aws_iam_user.macaz8.name

  groups = [
    aws_iam_group.eks_admin_console.name,
    aws_iam_group.frontend_developer_group_one.name,
  ]
}
