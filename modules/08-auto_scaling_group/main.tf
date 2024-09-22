# Create Launch Configuration
resource "aws_launch_configuration" "app" {
  name          = "app-launch-configuration"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_pair_name  # Use the input variable for key pair name
  security_groups = [var.public_sg_id]  # Use the input variable for security group

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y python3
              echo "Hello, World from ASG" > /home/ubuntu/index.html
              cd /home/ubuntu
              python3 -m http.server 80 &
              EOF
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "app" {
  launch_configuration = aws_launch_configuration.app.id
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  vpc_zone_identifier  = [var.private_subnet_a_id, var.private_subnet_b_id]  # Use the input variables

  target_group_arns = [var.target_group_arn]  # Use the input variable for target group ARN

  tag {
    key                 = "Name"
    value               = "ASG_Instance"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [desired_capacity]  
  }
}
