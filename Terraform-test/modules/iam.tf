# ------------------------------------------------------------#
# IAM Role for EC2 instance. S3,cloudwatch,ssm,RDS. 
# ※ Instance Profileはec2.tfで作成。
# ------------------------------------------------------------#
# Policy
resource "aws_iam_policy" "IAMPolicyForEC2" {
  name        = "IAMPolicyForEC2"
  path        = "/"
  description = "S3,cloudwatch,ssm,RDS is allowed"
 
  # templatesディレクトリからjsonファイルを参照。
  policy = file("../../templates/iam_template/ec2_iam_policy.json")
}

# Role
resource "aws_iam_role" "IAMRoleForEC2" {
  name = "IAMRoleForEC2"
  description = "IAM Role for EC2 instance."

  # templatesディレクトリからjsonファイルを参照。
  assume_role_policy = file("../../templates/iam_template/ec2_iam_role.json")
}

# Role attachment
resource "aws_iam_role_policy_attachment" "IAMAttachForEC2" {
  role       = aws_iam_role.IAMRoleForEC2.name
  policy_arn = aws_iam_policy.IAMPolicyForEC2.arn
}
