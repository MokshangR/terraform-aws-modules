#https://registry.terraform.io/providers/hashicorp/aws
#key-pair login 
resource "aws_key_pair" "module_ec2_key" {       #syntax: resource "resource_type" "resource_name"
  key_name   = "${var.env}-module-ec2"
  public_key = file("automate-ec2.pub")

  tags = {
    Environment = var.env
  }
}

#VPC & Security
resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "module-sg" {
    name = "${var.env}-module-ec2-sg"
    vpc_id = aws_default_vpc.default.id #interpolation (inherit/extract from TF block )

    # inbound rules 
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "SSH open"
        }
    ingress {   
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "http open"
        }

    #outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "-1 means all protocols. Ports 0 to 0 means all ports. Anything attached to a security group with this rule will have unrestricted access out."
    }
    tags = {
        Name = "${var.env}-module-ec2-sg"
    }
}

#aws instance

resource "aws_instance" "module_ec2" {
    count = var.instance_count                    #creates multiple instances with same config and names. meta args (count, depends_on, for_each)
    
    depends_on = [ aws_security_group.module-sg, aws_key_pair.module_ec2_key ]  #ensures these are created first

    # for_each = tomap({
    #   auto-tf-1="t2.micro",
    #   auto-tf-2="t2.micro"
    # })   #map to create multiple instances with unique keys
    
    key_name = aws_key_pair.module_ec2_key.key_name
    security_groups = [ aws_security_group.module-sg.name ]   #name or id
    #instance_type = var.ec2_instance_type    #variable from variables.tf
    instance_type = var.instance_type              #value from map
    ami = var.ec2_ami_id

    root_block_device {
      volume_size = var.env == "prod" ? 10 : 8   #ternary operator (conditional expression) - if env is prod, size 16 else default size
      volume_type = "gp3"
    }
    tags = {
        Name = "${var.env}-module-ec2"   #count.index starts from 0, index is used to create unique names
        Environment = var.env
      }
}