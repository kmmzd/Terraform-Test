# ------------------------------------------------------------#
# InstanceProfile 
# See "iam.tf" for "role" and "policy".
# ------------------------------------------------------------#
resource "aws_iam_instance_profile" "this" {
  name  = "sample_profile"
  role = aws_iam_role.IAMRoleForEC2.name
}


# ------------------------------------------------------------#
# ec2
# ------------------------------------------------------------#

# SSMのパブリックパラメータから、常に最新のLinux2を取得。
data "aws_ssm_parameter" "ec2_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "this" {
  count                  = var.ec2unit #環境ごとに作成台数を変更する。
  ami                    = data.aws_ssm_parameter.ec2_ami.value
  instance_type          = var.instance_type
  iam_instance_profile   = aws_iam_instance_profile.this.name
  key_name               = aws_key_pair.this.id
  subnet_id              = [
    aws_subnet.Pub1aSubnet.id,
    aws_subnet.Pub1cSubnet.id][count.index % 2]
  vpc_security_group_ids = [aws_security_group.SGPubEC2.id]
  user_data              = file("../../templates/user_data/mysql_install.sh")

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp2"
    volume_size = 8
  }

  tags = {
    Name = "${var.ProjectName}_${var.ec2Name}_${var.Environment}_${count.index + 1}"
  }
}

