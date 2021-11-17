
data "aws_ami" "amazonOS" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"] #get the image not creating an amazon image 
  }
}

resource "aws_network_interface" "interface_vm" { 
  subnet_id       = var.subnet  
  security_groups = var.security_groups

  tags = {
    Name     = "${var.name_of_instance}-interface"
    Owner = "Lartey"
  }
}

resource "aws_instance" "webserver" {
  ami           = data.aws_ami.amazonOS.id
  instance_type = "t3.micro"
  network_interface {# call a function built in argument in terraform  >> resource "aws_network_interface" "interface_vm" 
      network_interface_id = aws_network_interface.interface_vm.id # connect the 
      device_index = 0 # creates cards that allow you to connect to different subnets in the same avalability zone, you can have different IP addresses aswell 
  }

  tags = {
    Name = var.name_of_instance
    Owner = "Lartey"
  }
}

resource "aws_lb_target_group_attachment" "instance_attach" {
  target_id        = aws_instance.webserver.id # i want this machine above  
  target_group_arn = var.target_group # to be connected to this target group
  port             = 80 #  which is listening on port 80 
}









# remote module >> terraform website 
# local module >> in your repo 