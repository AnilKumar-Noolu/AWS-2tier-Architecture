#creating a load balancer
resource "aws_lb" "My-lb" {
  name               = "My-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public-subnet1.id, aws_subnet.public-subnet2.id]
  security_groups    = [aws_security_group.My-sg.id]
}

#creating load balancer target group
resource "aws_lb_target_group" "My-lb-tg" {
  name     = "Customtargetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.custom-vpc.id

  depends_on = [aws_vpc.custom-vpc]
}

#creating load balancer target group attachment-1
resource "aws_lb_target_group_attachment" "My-target-group1" {
  target_group_arn = aws_lb_target_group.My-lb-tg.arn
  target_id        = aws_instance.My-web-instance1.id
  port             = 80

  depends_on = [aws_instance.My-web-instance1]
}

#creating load balancer target group attachment-2
resource "aws_lb_target_group_attachment" "My-target-group2" {
  target_group_arn = aws_lb_target_group.My-lb-tg.arn
  target_id        = aws_instance.My-web-instance2.id
  port             = 80

  depends_on = [aws_instance.My-web-instance2]
}

#creating load balancer listener
resource "aws_lb_listener" "My-listener" {
  load_balancer_arn = aws_lb.My-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.My-lb-tg.arn
  }
}
