# Create Load Balancer (ALB)
resource "aws_lb" "alb" {
  internal                    = false
  load_balancer_type          = "application"
  security_groups             = [var.public_sg_id]
  subnets                     = [var.public_subnet_a_id, var.public_subnet_b_id]
  enable_deletion_protection   = false
  tags = {
    Name = "alb"
  }
}

# Create Target Group
resource "aws_lb_target_group" "alb-TG" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    protocol = "HTTP"
    path     = "/"
  }

  tags = {
    Name = "alb-TG"
  }
}

# Create Listener for ALB
resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-TG.arn
  }
}
