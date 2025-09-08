# AWS Infrastructure as Code with Terraform

This project demonstrates Infrastructure as Code (IaC) using Terraform to provision and manage AWS resources in a modular way.

## Project Overview

The project uses Terraform modules to create and manage:

- EC2 instances with automated configuration
- DynamoDB tables for state locking
- S3 buckets for state storage
- Infrastructure automation components

## Project Structure

```
├── modules/
│   ├── ddb.tf         # DynamoDB configuration
│   ├── ec2.tf         # EC2 instance configuration
│   ├── s3.tf          # S3 bucket configuration
│   └── var.tf         # Variables definition
├── main.tf            # Main configuration
├── providers.tf       # AWS provider configuration
├── terraform.tf       # Terraform settings
└── terraform.tfvars   # Variable values
```

## Prerequisites

- AWS CLI configured with appropriate credentials
- Terraform v1.0.0 or later
- An AWS account with necessary permissions

## Setup Instructions

1. Clone this repository

```bash
git clone <repository-url>
cd terra-modules
```

2. Update `terraform.tfvars` with your configuration
3. Initialize Terraform

```bash
terraform init
```

4. Review the execution plan

```bash
terraform plan
```

5. Apply the configuration

```bash
terraform destroy
```

## Module Configuration

### EC2 Module

- Creates EC2 instances
- Configures security groups
- Manages SSH keys

### DynamoDB Module

- Creates DynamoDB tables
- Configures capacity modes
- Sets up hash keys

### S3 Module

- Creates S3 buckets
- Configures access policies
- Sets up encryption

## Variables

Key variables that need to be configured in `terraform.tfvars`:

- `env`: Environment name (dev/staging/prod)
- `instance_type`: EC2 instance size
- `ami_id`: AMI ID for EC2 instances
- `bucket_name`: Unique S3 bucket name
- `hash_key`: DynamoDB table hash key

## Tags

Resources are tagged with:

- Environment
- Project
- Managed_by

## Best Practices

- Keep sensitive data out of version control
- Use workspaces for managing multiple environments
- Follow naming conventions for resources
- Document all module inputs/outputs

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License
