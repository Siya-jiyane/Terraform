provider "aws" {
    region     = "us-east-1" 
}

resource "aws_instance" "MyEC2" {
    ami = "ami-0360c520857e3138f"
    instance_type = "t3.micro"
}
#     tags = {
#         Name = "Which is Which"
#     }
# }

# resource "aws_ec2_instance_state" "MyEC2" {
#     instance_id = aws_instance.MyEC2.id
#     state = "stopped"
# }


# resource "aws_instance" "terraformec2" {
#     ami = "ami-0360c520857e3138f"
#     instance_type = "t3.micro"

#     tags = {
#         Name = "terraformec2"
#     }
# }

# resource "aws_ec2_instance_state" "terraformec2" {
#         instance_id = aws_instance.terraformec2.id
#         state = "stopped"
# }

# resource "aws_iam_user" "terraformuser-again" {
#     name = "terraformuser"
#     }

 