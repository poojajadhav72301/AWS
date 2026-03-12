provider "aws" {
   region = "us-east-1"
}
resource "aws_iam_user" "simple_user" {
   name = "teraform-code"
}