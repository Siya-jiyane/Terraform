provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "example" {
    ami = "ami-0332d564d76dbd8d6"
    instance_type = "t2.mirco"
    key_name = ""

    provisioner "local-exec" {
        command = "echo Server created"
    }
}