resource "aws_instance" "myec2" {
    ami = "ami-"
    instance_type = "t2.micro"
}

output "instance_id" {
    value = aws_instance.myec2.id
}