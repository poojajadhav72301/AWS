provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-0d0382ad5ecc70350 " # us-east-1
  instance_type = "t3.micro"
  tags = {
      Name = "AWS-instance"
  }
}
