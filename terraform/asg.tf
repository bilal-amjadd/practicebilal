resource "aws_autoscaling_group" "aws_autoscaling_group" {
    name              = "asg"
    desired_capacity  = 2
    max_size          = 5
    min_size          = 1
    health_check_type = "ELB"
    launch_template {
      id      = aws_launch_template.launch_template.id
      version = "$latest"
    }

    vpc_zone_identifier = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]

    target_group_arns   = [aws_lb_target_group.target_group.arn]
  
}