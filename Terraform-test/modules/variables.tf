variable "ProjectName" {
  description = "Name tag prefix."
  type        = string
  default     = "tftest"
}

variable "Environment" {
  description = "prd or dev"
  type        = string
  default     = "dev"
}

# ------------------------------------------------------------#
# variables for vpc
# ------------------------------------------------------------#
variable "VpcName" {
  description = "VPC name. This Parameter will be a Name tag."
  type        = string
  default     = "VPC"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "cidr" {
  description = "VPC IPv4 CidrBlock"
  type        = string
  default     = "10.0.0.0/16"
}

variable "instance_tenancy" {
  description = "instance_tenancy.There is a charge other than default."
  type        = string
  default     = "default"
}

variable "enable_ipv6" {
  description = "Basically false unless you want to use ipv6."
  type        = bool
  default     = false
}

# ------------------------------------------------------------#
# variables for Internet_Gateway
# ------------------------------------------------------------#  
variable "IGwName" {
  description = "Internet Gateway name. This Parameter will be a Name tag."
  type        = string
  default     = "IGw"
}

# ------------------------------------------------------------#
# variables for RouteTable
# ------------------------------------------------------------#  
variable "RouteTableName" {
  description = "Route Table Name. This Parameter will be a Name tag."
  type        = string
  default     = "rt"
}

# ------------------------------------------------------------#
# variables for　Public Subnet 1a,1c
# ------------------------------------------------------------#     
variable "Pub1aSubnetName" {
  description = "Public Subnet 1a Name tag."
  type        = string
  default     = "pub_1a_Subnet"
}

variable "Pub1aSubnetCidrBlock" {
  description = "Public Subnet 1a CidrBlock."
  type        = string
  default     = "10.0.0.0/24"
}

variable "Pub1cSubnetName" {
  description = "Public Subnet 1c Name tag."
  type        = string
  default     = "pub_1c_Subnet"
}

variable "Pub1cSubnetCidrBlock" {
  description = "Public Subnet 1c CidrBlock."
  type        = string
  default     = "10.0.1.0/24"
}

# ------------------------------------------------------------#
# variables for　Private Subnet 1a,1c
# ------------------------------------------------------------#     
variable "Pri1aSubnetName" {
  description = "Private Subnet 1a Name tag."
  type        = string
  default     = "pri_1a_Subnet"
}

variable "Pri1aSubnetCidrBlock" {
  description = "Private Subnet 1a CidrBlock."
  type        = string
  default     = "10.0.2.0/24"
}

variable "Pri1cSubnetName" {
  description = "Private Subnet 1c Name tag."
  type        = string
  default     = "pri_1c_Subnet"
}

variable "Pri1cSubnetCidrBlock" {
  description = "Private Subnet 1c CidrBlock."
  type        = string
  default     = "10.0.3.0/24"
}

# ------------------------------------------------------------#
# variables for ALB Subnet 1a,1c
# ------------------------------------------------------------#     
variable "PrimarySubnetName" {
  description = "Primary Subnet 1a Name tag."
  type        = string
  default     = "Primary_Subnet_ALB"
}

variable "PrimarySubnetCidrBlock" {
  description = "Primary Subnet 1a CidrBlock."
  type        = string
  default     = "10.0.4.0/24"
}

variable "SecondarySubnetName" {
  description = "Secondary Subnet 1c Name tag."
  type        = string
  default     = "Secondary_Subnet_ALB"
}

variable "SecondarySubnetCidrBlock" {
  description = "Secondary Subnet 1c CidrBlock."
  type        = string
  default     = "10.0.5.0/24"
}

# ------------------------------------------------------------#
# variables for Security Group
# ------------------------------------------------------------#  
variable "SGPubEC2Name" {
  description = "Security group name for EC2 instance. This Parameter will be a Name tag."
  type        = string
  default     = "SG_Pub_EC2"
}

variable "SGRDSName" {
  description = "Security group name for RDS instance. This Parameter will be a Name tag."
  type        = string
  default     = "SG_RDS"
}

variable "SGELBName" {
  description = "Security group name for ELB. This Parameter will be a Name tag."
  type        = string
  default     = "SG_ELB"
}

# ------------------------------------------------------------#
# variables for iam.tf
# ------------------------------------------------------------#

  # There are no variables.

# ------------------------------------------------------------#
# variables for keypair.tf
# ------------------------------------------------------------# 
variable "KeyName" {
  description = "Name of the keypair." 
  type        = string
  default     = "mykey"
}

# ------------------------------------------------------------#
# variables for ec2.tf
# ------------------------------------------------------------# 
variable "ec2Name" {
  description = "ec2 instance name. This Parameter will be a Name tag." 
  type        = string
  default     = "ec2"
}

variable "ec2unit" {
  description = "Number of ec2 instance created." 
  type        = number
  default     = 1
}

variable "instance_type" {
  description = "ec2 instance_type." 
  type        = string
  default     = "t2.micro"
}

# ------------------------------------------------------------#
# variables for rds.tf
# ------------------------------------------------------------# 
variable "DBSubnetGroupName" {
  description = "DB Subnet Group Name.This Parameter will be a Name tag." 
  type        = string
  default     = "db_subnet_group"
}

variable "RDSName" {
  description = "RDS Name.This Parameter will be a Name tag." 
  type        = string
  default     = "rds"
}

variable "allocated_storage" {
  description = "instance storage size ." 
  type        = string
  default     = "10"
}

variable "storage_type" {
  description = "instance storage type ." 
  type        = string
  default     = "gp2" # gp2 = 汎用SSD
}

variable "engine_version" {
  description = "mysql engine version." 
  type        = string
  default     = "8.0.27"
}

variable "instance_class" {
  description = "instance instance class." 
  type        = string
  default     = "db.t2.micro" 
}

variable "username" {
  description = "The master username for the database." 
  type        = string
  default     = "dbuser" 
}

variable "password" {
  description = "Password for the master DB user. " 
  type        = string
  default     = "dbpassword" 
}

variable "multi_az" {
  description = "multi az." 
  type        = bool
  default     = false 
}

# ------------------------------------------------------------#
# variables for elb.tf
# ------------------------------------------------------------# 
variable "ALBName" {
  description = "ALB Name.This Parameter will be a Name tag." 
  type        = string
  default     = "ALB"
}






