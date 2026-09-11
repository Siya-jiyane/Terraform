provider "aws" {
    region = "us-east-1"
}

resource "aws_eip" "nat_eip" {
    domain = "vpc"

    tags = {
        Name = "test-nat-eip"
    }
}

output "nat_eip_public_ip" {
    value = aws_eip.nat_eip.public_ip
}