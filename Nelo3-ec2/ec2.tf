resource "aws_instance" "ec2-demo" {
    ami                  = data.aws_ami.linux-ec2.id
    instance_type          = var.instance_type
    # key_name = cicd-keypair


  tags = {
    Terraform  = "true"
    Environment = "test"
    created = "terraform"
  }
}
    
data "aws_ami" "linux-ec2" {
  most_recent      = true

  owners           = ["013907871322"]

  filter {
    name   = "name"
    values = ["suse-sles-sap-15-sp4-byos-v20220621-hvm-ssd-x86_64*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}



output "ami_id" {
    description = "the ami of linux-ec2"
    value = aws_instance.ec2-demo.ami
  
}

output "instance_public_ip" {
    description = "the public IP of linux-ec2"
    value = aws_instance.ec2-demo.associate_public_ip_address
  
}

output "instance_arn" {
    description = "the public IP of linux-ec2"
    value = aws_instance.ec2-demo.arn
  
}