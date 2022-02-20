# ------------------------------------------------------------#
# outputs for vpc.tf
# ------------------------------------------------------------#
output "vpc" {
  value       = aws_vpc.this
}

output "internet_gateway" {
  value       = aws_internet_gateway.this
}

output "route_table" {
  value       = aws_route_table.this
}

output "route" {
  value       = aws_route.this
}

output "route_table_association_Pub1aSubnet" {
  value       = aws_route_table_association.Pub1aSubnet
}

output "route_table_association_Pub1cSubnet" {
  value       = aws_route_table_association.Pub1aSubnet
}

output "route_table_association_PrimarySubnet" {
  value       = aws_route_table_association.PrimarySubnet
}

output "route_table_association_SecondarySubnet" {
  value       = aws_route_table_association.SecondarySubnet
}

output "Pub1aSubnet" {
  value       = aws_subnet.Pub1aSubnet
}

output "Pub1cSubnet" {
  value       = aws_subnet.Pub1cSubnet
}

output "Pri1aSubnet" {
  value       = aws_subnet.Pri1aSubnet
}

output "Pri1cSubnet" {
  value       = aws_subnet.Pri1cSubnet
}

output "PrimarySubnet" {
  value       = aws_subnet.PrimarySubnet
}

output "SecondarySubnet" {
  value       = aws_subnet.SecondarySubnet
}

# ------------------------------------------------------------#
# outputs for securitygroup.tf
# ------------------------------------------------------------#
output "SGPubEC2" {
  value       = aws_security_group.SGPubEC2
}

output "inbound_http_EC2" {
  value       = aws_security_group_rule.inbound_http_EC2
}

output "inbound_https_EC2" {
  value       = aws_security_group_rule.inbound_https_EC2
}

output "inbound_ssh_EC2" {
  value       = aws_security_group_rule.inbound_ssh_EC2
}

output "SGRDS" {
  value       = aws_security_group.SGRDS
}

output "inbound_mysql" {
  value       = aws_security_group_rule.inbound_mysql
}

output "SGELB" {
  value       = aws_security_group.SGELB
}

output "inbound_http_ELB" {
  value       = aws_security_group_rule.inbound_http_ELB
}

output "inbound_https_ELB" {
  value       = aws_security_group_rule.inbound_https_ELB
}

# ------------------------------------------------------------#
# outputs for iam.tf
# ------------------------------------------------------------#
output "IAMPolicyForEC2" {
  value       = aws_iam_policy.IAMPolicyForEC2
}

output "IAMRoleForEC2" {
  value       = aws_iam_role.IAMRoleForEC2
}

output "IAMAttachForEC2" {
  value       = aws_iam_role_policy_attachment.IAMAttachForEC2
}

# ------------------------------------------------------------#
# outputs for keypair.tf
# ------------------------------------------------------------#
output "aws_key_pair" {
  value       = aws_key_pair.this
}

# ------------------------------------------------------------#
# outputs for ec2.tf
# ------------------------------------------------------------#
output "instance_profile" {
  value       = aws_iam_instance_profile.this
}

output "ec2_instance" {
  value       = aws_instance.this
  sensitive   = true
}

# ------------------------------------------------------------#
# outputs for rds.tf
# ------------------------------------------------------------#
output "aws_db_subnet_group" {
  value       = aws_db_subnet_group.this
}

output "aws_db_instance" {
  value       = aws_db_instance.this
  sensitive   = true
}

# ------------------------------------------------------------#
# outputs for elb.tf
# ------------------------------------------------------------#
output "aws_lb" {
  value       = aws_lb.this
}

output "aws_lb_target_group" {
  value       = aws_lb_target_group.this
}
output "aws_alb_listener" {
  value       = aws_alb_listener.this
}
