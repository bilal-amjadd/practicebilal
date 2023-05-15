resource "aws_vpc" "main" {
    cidr_block = "10.100.0.0/16"

    tags = {
        Name = "main-vpc"
    }
}

resource "aws_internet_gateway" "internet_gateway" {
    vpc_id  = aws_vpc.main.id
   
}

# resource "aws_subnet" "private_subnet_1"{
#     cidr_block        = "10.100.0.0/24"
#     vpc_id            = aws_vpc.main.id
#     availability_zone = "us-east-1a"

#     tags = {
#         Name = "private-subnet-1"
#     }
# }

resource "aws_subnet" "public_subnet_1"{
    cidr_block              = "10.100.1.0/24"
    vpc_id                  = aws_vpc.main.id
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1b"

    tags = {
        Name = "public-subnet-1"
    }
}

resource "aws_subnet" "public_subnet_2"{
    cidr_block              = "10.100.2.0/24"
    vpc_id                  = aws_vpc.main.id
    map_public_ip_on_launch = true
    availability_zone       = "us-east-1c"

    tags = {
        Name = "public-subnet-2"
    }
}

# resource "aws_route_table" "private_route_table" {
#     vpc_id         = aws_vpc.main.id

#     route  {
#         cidr_block = "0.0.0.0/0"
#         gateway_id   = aws_internet_gateway.internet_gateway.id
#     }

#     tags = {
#       Name = "private-route-table"
#     }
# }

resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id   = aws_internet_gateway.internet_gateway.id
    }


    tags = {
      Name = "public-route-table"
    }
}


# resource "aws_route_table_association" "private_route_table_association" {
#     subnet_id      = aws_subnet.private_subnet_1
#     route_table_id = aws_route_table.private_route_table.id
# }

resource "aws_route_table_association" "public_route_table_association_1" {
    subnet_id      = aws_subnet.public_subnet_1
    route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_route_table_association_2" {
    subnet_id      = aws_subnet.public_subnet_2
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route" "public_internet_gateway" {
    route_table_id              = aws_route_table.public_route_table.id
    destination_ipv6_cidr_block = "0.0.0.0/0"
    gateway_id                  = aws_internet_gateway.internet_gateway.id
  
}