provider "aws" {
  region = "us-east-1"  # Change this to your preferred region
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-04b4f1a9cf54c11d0" # Replace with the latest Ubuntu AMI
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-005245dc454c6d269"] # Replace it with the security group of 2048-Jenkins-Terraform-Automation
  key_name      = "my-linux"  # Replace with your Key-name
  tags = {
    Name = "Terraform-Jenkins-Server"
  }
}

output "instance_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
