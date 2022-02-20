# keypairの生成。
resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# 秘密鍵（private_key_pem）をs3に保存。
resource "aws_s3_object" "PrivateKey" {
  bucket  = "tftest-key"
  key     = "${var.ProjectName}_${var.KeyName}_${var.Environment}.pem"
  content = tls_private_key.this.private_key_pem
}

# 公開鍵（public_key_openssh）をs3に保存。
resource "aws_s3_object" "PublicKey" {
  bucket  = "tftest-key"
  key     = "${var.ProjectName}_${var.KeyName}_${var.Environment}.pub"
  content = tls_private_key.this.public_key_openssh
}

# keypairをEC2に登録。ec2.tfで参照する。
resource "aws_key_pair" "this" {
  key_name   = "${var.ProjectName}_${var.KeyName}_${var.Environment}"
  public_key = tls_private_key.this.public_key_openssh
}



