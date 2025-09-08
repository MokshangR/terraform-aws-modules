variable "env" {
  description = "values: dev, test, prod. when var not used in code, terraform workspace list returns 'default'"
  type = string
}

variable "bucket_name" {
  description = "values: must be globally unique"
  type = string
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number  
}

variable "instance_type" {
    description = "EC2 instance type"
    type        = string  
}

variable "ec2_ami_id" {
  #default = "ami-0f918f7e67a3323f0"      #ubuntu
  description = "AMI ID for the EC2 instance"
  type = string
}

variable "hash_key" {
  description = "DynamoDB table hash key"
  type = string  
}