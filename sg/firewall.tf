provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "firewalls" {
    name = "terraform-firewall"
    description = "Security group for firewall rules"

    tags = {
        Name = "terraform-firewall"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.firewalls.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"

    tags = {
        Name = "Allow SSH Ingress"
    }
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh" {
    security_group_id = aws_security_group.firewalls.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    to_port = 80
    ip_protocol = "tcp"

    tags = {
        Name = "Allow SSH Egress"
    }
    
}

resource "local_file" "test" {
    content = "This is a test local file!"
    filename = "${path.module}/foo.txt"
}
