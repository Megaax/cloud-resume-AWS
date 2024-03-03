# Cloud Resume Challenge - AWS, Terraform, and GitHub Actions

Welcome to my Cloud Resume Challenge project! This initiative showcases my skills in deploying a static website with AWS services, managing infrastructure using Terraform, and implementing continuous integration with GitHub Actions.

## Project Components

### 1. HTML, CSS, and JavaScript

Crafted my resume in HTML, styled with CSS for a visually appealing layout. Integrated JavaScript to include a visitor counter, providing insights into website traffic.

### 2. AWS S3 Static Website

Deployed the HTML resume as a static website on Amazon S3, ensuring accessibility and scalability.

### 3. HTTPS with CloudFront

Enabled HTTPS for the S3 website URL using Amazon CloudFront, enhancing security.

### 4. DynamoDB for Data Management

Utilized Amazon DynamoDB as a NoSQL database to store and manage data, ensuring efficient retrieval and updates.

### 5. API Gateway and Lambda

Created an API using AWS API Gateway and Lambda functions to facilitate communication with DynamoDB. Implemented in Python for backend logic using the boto3 library.

### Infrastructure as Code (IaC) with Terraform

For robust and reproducible AWS resource provisioning, I've embraced the concept of Infrastructure as Code (IaC) using Terraform. The Terraform script automates the creation and configuration of vital components for my Cloud Resume Challenge project.

#### IAM Role for Lambda

The code defines an IAM role, `iam_for_lambda`, allowing the Lambda service to assume this role, facilitating secure execution of Lambda functions.

#### Lambda Function Configuration

- **DynamoDB Access:** I attach the `AmazonDynamoDBAccess` policy to the IAM role, granting comprehensive access to DynamoDB, a crucial component for storing and managing data in this project. [DynamoDB Console](https://console.aws.amazon.com/dynamodb/)
  
- **Lambda Function Packaging:** Utilizing Terraform, I package the Lambda function code into a ZIP file, streamlining the deployment process.
  
- **Lambda Function Definition:** The script specifies the Lambda function, `viewsCounter`, including its filename, function name, role, and handler. This ensures the proper execution of my Python code on the Lambda service. [Lambda Console](https://console.aws.amazon.com/)

#### S3 Bucket

- **S3 Bucket Creation:** The Terraform script creates an S3 bucket, `myBucket`, where the static website content is hosted. [S3 Console](https://s3.console.aws.amazon.com/)
  
- **Website Hosting Configuration:** The S3 bucket is configured for website hosting, ensuring seamless serving of static content.

#### DynamoDB Table

- **DynamoDB Table Creation:** The script defines a DynamoDB table, `basic-dynamodb-table`, specifying attributes and settings for data storage. [DynamoDB Console](https://console.aws.amazon.com/dynamodb/)

#### CloudFront Distribution

- **CloudFront Setup:** A CloudFront distribution is configured to provide a scalable and secure content delivery network (CDN) for the static website hosted in the S3 bucket. [CloudFront Console](https://console.aws.amazon.com/cloudfront/)



These infrastructure configurations enable a streamlined and efficient deployment of AWS resources, aligning with best practices for managing cloud infrastructure.

