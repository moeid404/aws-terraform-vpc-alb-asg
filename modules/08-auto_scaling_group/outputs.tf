output "launch_configuration_id" {
  description = "The ID of the launch configuration"
  value       = aws_launch_configuration.app.id
}

output "autoscaling_group_id" {
  description = "The ID of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.id
}

output "autoscaling_group_arn" {
  description = "The ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.arn
}

output "autoscaling_group_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.app.name
}
