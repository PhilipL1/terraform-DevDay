

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16" # the number  of people that can access 
  instance_tenancy = "default"

  tags = {
    Name  = "Philip"
    Owner = "Philip Lartey"
  }
}

resource "aws_subnet" "first" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/24" # 10.0.0.1,  10.0.0.2,.... 10.0.0.255,  IP range 
  availability_zone = "${var.region}a"

  tags = {
    Name  = "Lartey_Subnet_region_a"
    Owner = "Lartey"
  }
}

resource "aws_subnet" "second" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24" # 10.0.1.1,  10.0.1.2,.... 10.0.1.255,  
  availability_zone = "${var.region}b"

  tags = {
    Name  = "Lartey_Subnet_region_b"
    Owner = "Lartey"
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Lartey-igw"
  }
}

