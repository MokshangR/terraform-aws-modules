# Main Terraform configuration file to call the modules and pass variables to them

#development environment
module "dev-infra" {
    source = "./modules"
    env         = "dev"
    bucket_name = "infra-dev-s3-bucket-mkr"
    instance_count = 1
    instance_type  = "t2.micro"
    ec2_ami_id     = "ami-0f918f7e67a3323f0"   #ubuntu
    hash_key       = "LockID"
}

#staging environment
module "stg-infra" {
    source = "./modules"
    env         = "stg"
    bucket_name = "infra-stg-s3-bucket-mkr"
    instance_count = 1
    instance_type  = "t2.micro"
    ec2_ami_id     = "ami-0f918f7e67a3323f0"   #ubuntu
    hash_key       = "LockID"
}

#production environment
module "prd-infra" {
    source = "./modules"
    env         = "prd"
    bucket_name = "infra-prd-s3-bucket-mkr"
    instance_count = 2
    instance_type  = "t3.micro"
    ec2_ami_id     = "ami-0f918f7e67a3323f0"   #ubuntu
    hash_key       = "LockID"
}