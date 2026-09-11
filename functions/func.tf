provider "aws" {
    region = "us-east-1"       
}


resource "aws_aim_user" "user" {
    name = "15-aug-user"
}

resource "aws_iam_user_policy" "user_policy" {
    name = "demo-user-policy"
    user = aws_aim_user.user.name


policy = file("./my-policy.json")
}