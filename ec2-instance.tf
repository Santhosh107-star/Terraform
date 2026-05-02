provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "first-ec2" {
  ami             = "ami-02eb0c2388ee999f9"
  instance_type   = "t2.micro"
  key_name        = "santhoshk"
  security_groups = ["default"]
  tags = {
    Name = "first-ec2-vm"
  }
}