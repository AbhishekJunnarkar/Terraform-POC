> This repo contains hands on examples of the "Terraform Up and Running" book by Yevgeniy Brikman

# Terraform-POC

Terraform POC to provision infrastructure across public cloud provider AWS.


## Terraform commonly used Commands

* $ terraform init
* $ terraform validate
* $ terraform plan
* $ terraform apply
* $ terraform destroy

## Storyline of the experiment

1. Deployed a single server in a specific region using a specific AMI and instance type
```
resource "aws_instance" "example" {
  ami = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  
  tags = {
    Name ="Terraform-example"
  }
}
```
