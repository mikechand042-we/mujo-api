resource "aws_instance" "main" {
    ami = var.ami_id
    key_name = var.key_name
    subnet_id = var.subnet_id
    instance_type = var.instance_type

    vpc_security_group_ids = [ aws_security_group.bilo.id ]
    associate_public_ip_address = true
    user_data = file("user-data.sh")
    tags = {
      Name = "execut-pipeline"
    }
  
}