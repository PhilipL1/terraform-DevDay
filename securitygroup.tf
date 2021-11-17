

#http - connection type 
#https - 
# SLL (old) >> TLS (new way of encrypting webpage)

#Security group - control which traffic can access the instance (firewall)


#NACL - subnet 

resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress { # incoming connnection only on port 80 
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80 #single port range  
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

  egress { #outbound connection can be any specified in cidir_block 
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"] # allow any out of bound 
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "allow SSH inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22 #default ssh port 
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}