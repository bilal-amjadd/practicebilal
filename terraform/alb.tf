resource "aws_lb" "load_balance" {
    name               = "lb"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [aws_security_group.allow_web.id]
    subnets            = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
}
resource "aws_lb_target_group" "target_group" {
    name     = "lb-target-group"
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.main.id
}
resource "aws_alb_listener" "listener" {
    load_balancer_arn = aws_lb.load_balance.id
    port              = 80
    protocol          = "HTTP"


    default_action {
      type             = "forward"
      target_group_arn = aws_lb_target_group.target_group.arn
    }

}
