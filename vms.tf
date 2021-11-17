# #CPU - how quickly it can process stuff 
# # NIC - allow you to connect to other computers 
# #NAT private IP to Public 

# data "aws_ami" "amazonOS" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn-ami-hvm-*-x86_64-gp2"] #creating an amazon image 
#   }
# }

# resource "aws_network_interface" "interface_vm" { # pepole can only access the VM on the private_ips 
#   subnet_id       = aws_subnet.first.id  #connect aws instance to the subnet 
#   #private_ips     = ["10.0.0.50"] amazon auto signs an ip address 
#   security_groups = [[aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]]
  

#   tags = {
#     Name     = "Philip Lartey"
#     Owner = "Lartey"
#   }
# }

# resource "aws_instance" "webserver" {
#   ami           = data.aws_ami.amazonOS.id
#   instance_type = "t3.micro"
#   network_interface {# call a function built in argument in terraform  >> resource "aws_network_interface" "interface_vm" 
#       network_interface_id = aws_network_interface.interface_vm.id # connect the 
#       device_index = 0 # creates cards that allow you to connect to different subnets in the same avalability zone, you can have different IP addresses aswell 
#   }

#   tags = {
#     Name = "Lartey-VM-01"
#     Owner = "Lartey"
#   }
# }

# resource "aws_network_interface" "interface_vm-02" { # pepole can only access the VM on the private_ips 
#   subnet_id       = aws_subnet.second.id  #connect aws instance to the subnet 
#   #private_ips     = ["10.0.0.50"] (amazon auto signs an ip address )
#   security_groups = [aws_security_group.allow_http.id, aws_security_group.allow_ssh.id]
  

#   tags = {
#     Name     = "Philip Lartey"
#     Owner = "Lartey"
#   }
# }

# resource "aws_instance" "webserver-02" {
#   ami           = data.aws_ami.amazonOS.id
#   instance_type = "t3.micro"
#   network_interface {# call a function (built in argument in terraform)  >> resource "aws_network_interface" "interface_vm" 
#       network_interface_id = aws_network_interface.interface_vm-02.id # connect the 
#       device_index = 0 
#   }

#   tags = {
#     Name = "Lartey-VM-02"
#     Owner = "Lartey"
#   }
# }

module "instance-01" {
  source = "./instance_creation"
  subnet = aws_subnet.first.id
  security_groups = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  name_of_instance = "Lartey-VM-O1"
  target_group = aws_lb_target_group.http.arn
}

module "instance-02" {
  source = "./instance_creation"
  subnet = aws_subnet.second.id
  security_groups = [aws_security_group.allow_ssh.id, aws_security_group.allow_http.id]
  name_of_instance = "Lartey-VM-O2"
  target_group = aws_lb_target_group.http.arn
}