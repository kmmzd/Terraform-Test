# ------------------------------------------------------------#
# alb
# ------------------------------------------------------------# 
resource "aws_lb" "this" {
  name                       = "${var.ProjectName}-${var.ALBName}-${var.Environment}"
  load_balancer_type         = "application"
  ip_address_type            = "ipv4"
  internal                   = false
  idle_timeout               = 60
  security_groups            = [aws_security_group.SGELB.id]
  subnets = [aws_subnet.PrimarySubnet.id, aws_subnet.SecondarySubnet.id]

  tags = {
    Name = "${var.ProjectName}_${var.ALBName}_${var.Environment}"
  }
}

# ------------------------------------------------------------#
# Target Group for ALB
# ------------------------------------------------------------# 
resource "aws_lb_target_group" "this" {
  name     = "TargetGroup-For-${var.ProjectName}-${var.ALBName}-${var.Environment}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.this.id
  deregistration_delay = "10"

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = 200
  }
  tags = {
    Name = "Target_Group_For_${var.ProjectName}_${var.ALBName}_${var.Environment}"
  }
}


resource "aws_lb_target_group_attachment" "this" {
  count  = length(aws_instance.this)
  target_group_arn = aws_lb_target_group.this.arn
  target_id       = "${element(aws_instance.this.*.id, count.index)}"
  port             = 80
}

# ------------------------------------------------------------#
# ALB Lisner
# ------------------------------------------------------------#  
resource "aws_alb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.this.arn
    type             = "forward"
  }
}

