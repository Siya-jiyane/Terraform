provider "aws" {
  region = "us-east-1"
}


# --------------------------------
# Docker Swarm Security Group
# --------------------------------

resource "aws_security_group" "docker" {
  name        = "docker-sg"
  description = "Security group for Docker swarm"

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "docker-sg"
  }
}


# --------------------------------
# SSH
# --------------------------------

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.docker.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  description = "SSH"
}


# --------------------------------
# Docker Swarm Management
# TCP 2377
# --------------------------------

resource "aws_vpc_security_group_ingress_rule" "swarm_management" {
  security_group_id = aws_security_group.docker.id

  referenced_security_group_id = aws_security_group.docker.id

  from_port   = 2377
  to_port     = 2377
  ip_protocol = "tcp"

  description = "Docker Swarm management"
}


# --------------------------------
# Docker Swarm Node Communication
# TCP 7946
# --------------------------------

resource "aws_vpc_security_group_ingress_rule" "swarm_node_tcp" {
  security_group_id = aws_security_group.docker.id

  referenced_security_group_id = aws_security_group.docker.id

  from_port   = 7946
  to_port     = 7946
  ip_protocol = "tcp"

  description = "Docker Swarm node communication TCP"
}


# --------------------------------
# Docker Swarm Node Communication
# UDP 7946
# --------------------------------

resource "aws_vpc_security_group_ingress_rule" "swarm_node_udp" {
  security_group_id = aws_security_group.docker.id

  referenced_security_group_id = aws_security_group.docker.id

  from_port   = 7946
  to_port     = 7946
  ip_protocol = "udp"

  description = "Docker Swarm node communication UDP"
}


# --------------------------------
# Docker Swarm Overlay Network
# UDP 4789
# --------------------------------

resource "aws_vpc_security_group_ingress_rule" "swarm_overlay" {
  security_group_id = aws_security_group.docker.id

  referenced_security_group_id = aws_security_group.docker.id

  from_port   = 4789
  to_port     = 4789
  ip_protocol = "udp"

  description = "Docker Swarm overlay network"
}


# --------------------------------
# Swarm Manager
# --------------------------------

resource "aws_instance" "docker1" {
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.docker.id]

  tags = {
    Name = "swarm01"
  }
}


# --------------------------------
# Swarm Worker 1
# --------------------------------

resource "aws_instance" "docker2" {
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.docker.id]

  tags = {
    Name = "swarm02"
  }
}


# --------------------------------
# Swarm Worker 2
# --------------------------------

resource "aws_instance" "docker3" {
  ami                    = "ami-0b6d9d3d33ba97d99"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.docker.id]

  tags = {
    Name = "swarm03"
  }
}