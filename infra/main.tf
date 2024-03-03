# Define an IAM Role for Lambda with an inline policy that allows Lambda service to assume this role
resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach the AmazonDynamoDBFullAccess policy to the IAM Role
resource "aws_iam_policy_attachment" "dynamodb_full_access" {
  name       = "dynamodb_full_access"
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  roles      = [aws_iam_role.iam_for_lambda.name]
}

# Archive the Lambda function code into a ZIP file
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/lambda/func.py"
  output_path = "${path.module}/lambda/packedlambda.zip"
}

# Define the Lambda function using the archived ZIP file
resource "aws_lambda_function" "my_func" {
  filename      = data.archive_file.lambda.output_path
  function_name = "my_func"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "func.lambda_handler" # Assuming your Python file has a function named "lambda_handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.8"
}

# Define an API Gateway URL for the Lambda function
resource "aws_lambda_function_url" "url1" {
  function_name      = aws_lambda_function.my_func.function_name
  authorization_type = "NONE"

  # Configure CORS for the API Gateway URL
  cors {
    allow_credentials = true
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["keep-alive", "date"]
    max_age           = 86400
  }
}

# Define a DynamoDB table
resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "viewstable"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "id"

  # Define the attributes of the DynamoDB table
  attribute {
    name = "id"
    type = "S"
  }
}

# Define an S3 bucket
resource "aws_s3_bucket" "myBucket" {
  bucket = "mega-tf-cloud-resume-challenge-1"
}

# Configure the S3 bucket for website hosting
resource "aws_s3_bucket_website_configuration" "mywebsiteBucket" {
  bucket = aws_s3_bucket.myBucket.id
  index_document {
    suffix = "index.html"
  }
}
