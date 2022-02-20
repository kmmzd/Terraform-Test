# ------------------------------------------------------------#
# Security Group for EC2 instances
# ------------------------------------------------------------#    
resource "aws_security_group" "SGPubEC2" {
  name        = var.SGPubEC2Name 
  description = "Allow HTTP,HTTPS,SSH"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.ProjectName}_${var.SGPubEC2Name}_${var.Environment}" 
  }
}

resource "aws_security_group_rule" "inbound_http_EC2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  
  security_group_id = aws_security_group.SGPubEC2.id
}

resource "aws_security_group_rule" "inbound_https_EC2" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  
  security_group_id = aws_security_group.SGPubEC2.id
}

resource "aws_security_group_rule" "inbound_ssh_EC2" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  
  security_group_id = aws_security_group.SGPubEC2.id
}

# ------------------------------------------------------------#
# Security Group for MySQL RDS instances
# ------------------------------------------------------------#  
resource "aws_security_group" "SGRDS" {
  name        = var.SGRDSName 
  description = "Only MySQL for SGPubEC2 is allowed"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.ProjectName}_${var.SGRDSName }_${var.Environment}" 
  }
}

resource "aws_security_group_rule" "inbound_mysql" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = aws_security_group.SGPubEC2.id
  
  security_group_id = aws_security_group.SGRDS.id
}

# ------------------------------------------------------------#
# Security Group for ELB
# ------------------------------------------------------------#  
resource "aws_security_group" "SGELB" {
  name        = var.SGELBName 
  description = "Allow HTTP,HTTPS"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.ProjectName}_${var.SGELBName}_${var.Environment}" 
  }
}

resource "aws_security_group_rule" "inbound_http_ELB" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  
  security_group_id = aws_security_group.SGELB.id
}

resource "aws_security_group_rule" "inbound_https_ELB" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  
  security_group_id = aws_security_group.SGELB.id
}



