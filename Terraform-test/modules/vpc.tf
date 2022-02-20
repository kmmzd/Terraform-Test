# ------------------------------------------------------------#
# vpc 
# ------------------------------------------------------------#
resource "aws_vpc" "this" {
  cidr_block                       = var.cidr
  instance_tenancy                 = var.instance_tenancy
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_dns_support               = var.enable_dns_support
  assign_generated_ipv6_cidr_block = var.enable_ipv6
  
  tags = {
    Name = "${var.ProjectName}_${var.VpcName}_${var.Environment}" 
  }
}

# ------------------------------------------------------------#
# Internet_Gateway
# ------------------------------------------------------------#  
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.ProjectName}_${var.IGwName}_${var.Environment}"
  }
}

# ------------------------------------------------------------#
# Route_Table
# ------------------------------------------------------------#  
resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  
  tags = {
    Name = "${var.ProjectName}_${var.RouteTableName}_${var.Environment}"
  }
}

resource "aws_route" "this" { 
  route_table_id         = aws_route_table.this.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

# ------------------------------------------------------------#
# Route_Table association for EC2,ALB
# ------------------------------------------------------------#  

resource "aws_route_table_association" "Pub1aSubnet" {
  subnet_id      = aws_subnet.Pub1aSubnet.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "Pub1cSubnet" {
  subnet_id      = aws_subnet.Pub1cSubnet.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "PrimarySubnet" {
  subnet_id      = aws_subnet.PrimarySubnet.id
  route_table_id = aws_route_table.this.id
}

resource "aws_route_table_association" "SecondarySubnet" {
  subnet_id      = aws_subnet.SecondarySubnet.id
  route_table_id = aws_route_table.this.id
}

# ------------------------------------------------------------#
# Public Subnet 1a,1c for EC2
# ------------------------------------------------------------#     
resource "aws_subnet" "Pub1aSubnet" { 
  vpc_id = aws_vpc.this.id 
  availability_zone = "ap-northeast-1a"
  cidr_block        = var.Pub1aSubnetCidrBlock 
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ProjectName}_${var.Pub1aSubnetName}_${var.Environment}"
  }
}

resource "aws_subnet" "Pub1cSubnet" {
  vpc_id = aws_vpc.this.id 
  availability_zone = "ap-northeast-1c"
  cidr_block        = var.Pub1cSubnetCidrBlock 
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ProjectName}_${var.Pub1cSubnetName}_${var.Environment}"
  }
}

# ------------------------------------------------------------#
# Private Subnet 1a,1c for RDS　※ db_subnet_groupはRDS.tfで作成。
# ------------------------------------------------------------#
resource "aws_subnet" "Pri1aSubnet" {
  vpc_id = aws_vpc.this.id 
  availability_zone = "ap-northeast-1a"
  cidr_block        = var.Pri1aSubnetCidrBlock 

  tags = {
    Name = "${var.ProjectName}_${var.Pri1aSubnetName}_${var.Environment}"
  }
}

resource "aws_subnet" "Pri1cSubnet" {
  vpc_id = aws_vpc.this.id 
  availability_zone = "ap-northeast-1c"
  cidr_block        = var.Pri1cSubnetCidrBlock 

  tags = {
    Name = "${var.ProjectName}_${var.Pri1cSubnetName}_${var.Environment}"
  }
}

# ------------------------------------------------------------#
# Public Subnet for ALB
# ------------------------------------------------------------# 
resource "aws_subnet" "PrimarySubnet" {
  vpc_id = aws_vpc.this.id 
  availability_zone = "ap-northeast-1a"
  cidr_block        = var.PrimarySubnetCidrBlock
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ProjectName}_${var.PrimarySubnetName}_${var.Environment}"
  }
}

resource "aws_subnet" "SecondarySubnet" {
  vpc_id = aws_vpc.this.id 
  availability_zone = "ap-northeast-1c"
  cidr_block        = var.SecondarySubnetCidrBlock 
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.ProjectName}_${var.SecondarySubnetName}_${var.Environment}"
  }
}