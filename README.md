> This repo contains hands on examples of the "Terraform Up and Running" book by Yevgeniy Brikman

# Terraform-POC

Terraform POC to provision infrastructure across public cloud provider AWS.

## Terraform commonly used Commands

* $ terraform init
* $ terraform validate
* $ terraform plan
* $ terraform apply
* $ terraform destroy
* $ terraform destroy -target resource.name (to destroy a specific resource)
* $ terraform graph
* $ terraform refresh
* $ terraform show

## Examples

### 1. Deployed a single server in a specific region using a specific AMI and instance type
```
resource "aws_instance" "example" {
  ami = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  
  tags = {
    Name ="Terraform-example"
  }
}
```

### 2. Deploy a Single Web Server that can respond to HTTP request
    
    Three Steps:
        
      1. Pass a shell script to User Data by setting the user_data argument
      
        ```
        user_data = <<-EOF
                      #!/bin/bash
                      echo "Hello,world" > index.html
                      nohup busybox httpd -f -p 8080 &
                      EOF
        ``` 

      2. AWS by default doesnt allow incoming and outgoing traffic from a EC2 instance.
        A security group is required to allows the EC2 Instance to receive traffic on port 8080   
       
        ```
        resource "aws_security_group" "instance" {
          name = "terraform-example-instance"
        
          ingress {
            from_port = 8080
            protocol = "tcp"
            to_port = 8080
            cidr_blocks = ["0.0.0.0/0"]
          }
        }
        ```
      3. Refer the security group in the ec2 instance
     
        vpc_security_group_ids = [aws_security_group.instance.id]
### 3.          