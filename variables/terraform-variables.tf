provider "aws" {
    region = "us-east-1"    
}

resource "aws_security_group" "allow_tls" {
    name = "terraform -sg"
    description = "Security group for NAT Gateway"

    tags = {
        Name = "terraform-sg"
    }
  
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4 = var.vpn_ip
    from_port = var.app_port
    ip_protocol = "tcp"
    to_port = var.app_port
}

resource "aws_vpc_security_group_egress_rule" "ssh_port" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4 = var.vpn_ip
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}
