
# load balancer : distribute traffic depending on the CPU space in the instance  
#auto-scalling : CPU goes above 50% (how much a computer can do) it will spin up a new VM 


resource "aws_lb" "main" {
  name               = "Lartey-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http.id]
  subnets            = [aws_subnet.first.id, aws_subnet.second.id]

  enable_deletion_protection = false 

  tags = {
    Owner = "Lartey"
  }
}
 
resource "aws_lb_listener" "listener_80" { # listen on 
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
#   ssl_policy        = # need to secure page but this is a simple http website not a htps full page 
#   certificate_arn   = need to secure page 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http.arn
  }
}

resource "aws_lb_target_group" "http" { # when you get traffic on port 80 do .... (should go to the VM)
  name     = "Lartey-LB-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}


