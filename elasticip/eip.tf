provider "aws" {
    region = "us-east-1"
}

resource "aws_eip" "eip" {
    #instance = aws_instance.web.id
    domain = "vpc"

    tags = {
        Name = "terraform-eip"
    }
}

output "public_ip" {
    value = "https://${aws_eip.eip.public_ip}:8080"
    # # value = aws_eip.eip.id
    # value = aws_eip.eip.public_dns
}