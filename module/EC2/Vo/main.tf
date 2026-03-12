resource "aws_instance" "myEC2" {
   instance_type = var.instance_type
   ami = var.ami
   key_name = "linux"
   
   tags = {
       name = "Terraform-module"
   }

}