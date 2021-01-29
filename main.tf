provider "aws" {
  region  = "us-east-1"
  profile = "adminabhi"
}
resource "aws_instance" "MyEc2" {
  # Ubuntu AMI
  ami                    = "ami-0885b1f6bd170450c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello,world" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "Terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = 8080
    protocol    = "tcp"
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "MySecondEc2Instance" {
  ami = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  tags = {
    Name="Terraform Example 2"
  }
}