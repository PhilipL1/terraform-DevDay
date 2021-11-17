# data "aws_ami" "amazonOS" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn-ami-hvm-*-x86_64-gp2"] 
#   }
# }

# resource "aws_launch_template" "main" {
#   image_id               = data.aws_ami.amazonOS.id
#   instance_type          = "t3.micro"
#   vpc_security_group_ids = [aws_security_group.allow_http.id]
# }


# resource "aws_autoscaling_group" "scale" {
#   #availability_zones = 
#   desired_capacity    = 3
#   max_size            = 6
#   min_size            = 1
#   vpc_zone_identifier = [aws_subnet.first.id, aws_subnet.second.id]


#   launch_template {
#     id      = aws_launch_template.main.id
#     version = "$Latest"
#   }

#   lifecycle {
#     ignore_changes = [load_balancers, target_group_arns]
#   }
# }