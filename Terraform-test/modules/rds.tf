# ------------------------------------------------------------#
# db subnet group
# ------------------------------------------------------------# 
resource "aws_db_subnet_group" "this" {
    name        = var.DBSubnetGroupName
    subnet_ids  = [aws_subnet.Pri1aSubnet.id, aws_subnet.Pri1cSubnet.id]
    tags = {
        Name = "${var.ProjectName}_${var.DBSubnetGroupName}_${var.Environment}"
    }
}

# ------------------------------------------------------------#
# rds
# ------------------------------------------------------------# 
resource "aws_db_instance" "this" {
  identifier           = "${var.ProjectName}-mysql-${var.RDSName}-${var.Environment}"
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = "mysql"
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name                 = "${var.ProjectName}_${var.Environment}" # DBインスタンスの作成時に作成するデータベースの名前。
  username             = var.username
  password             = var.password
  vpc_security_group_ids  = [aws_security_group.SGRDS.id]
  db_subnet_group_name = aws_db_subnet_group.this.name
  skip_final_snapshot = true # インスタンスの削除時にDBスナップショットを作成するかどうか。
  publicly_accessible = false
  multi_az = var.multi_az # dev環境ではfalse、prd環境ではtrue。
  tags = {
        Name = "${var.ProjectName}_mysql_${var.RDSName}_${var.Environment}"
    }

}

