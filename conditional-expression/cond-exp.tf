provider "aws" {
    region = "us-east-1"
}


resource "aws_instance" "my_instance" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = var.environment == "prod" ? "t2.large" : "t2.micro"
}