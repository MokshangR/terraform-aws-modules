resource "aws_dynamodb_table" "module_ddb_table" {   
  name           = "${var.env}-module-ddb"       # Name of the DynamoDB table. Must be unique within an AWS account and region.
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  tags = {
    Name = "${var.env}-module-ddb"
    Environment = var.env       
  }
}