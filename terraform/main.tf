resource "aws_instance" "ec2_instance" {
    ami = "ami-0cf2b4e024cdb6960"
    instance_type = "t2.micro"
    tags = {Name = "HTTP_SERVER"}
    key_name = "training"
    count = 1
}
