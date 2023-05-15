resource "aws_security_group" "allow_web" {
    name        = "allow web"
    description = "Allow incoming web traffic"
    vpc_id      = aws_vpc.main.id

    ingress {
        description = "http access"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {
        from_port = 0   
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}
  
resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow incoming SSH traffic"
    vpc_id      = aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress  {
        from_port = 0 
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}