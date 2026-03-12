module "ec2_module" {
    source = "../../../module/EC2/Vo"
    instance_type = var.instance_type
    ami = var.ami
}