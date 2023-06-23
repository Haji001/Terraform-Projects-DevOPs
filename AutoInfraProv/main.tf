
provider "Aws" {
    region = var.aws_region
  
}

resource "aws_s3_bucket" "app_bucket" {
    bucket = var.bucket_name
    acl = var.s3_bucket_acl
  
}
resource "aws_iam_instance_profile" "python-app_dev" {
    name = "python-app_dev"

    role = aw
  
}
resource "aws_instance" "python_app_server" {
    count = var.ec2_instance_count
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    iam_instance_profile = aws_iam_instance_profile.python-app_dev

}

resource "aws_iam_role" "python-app_role" {
    name = "python-app_role"
    assume_role_policy = <<EOF
  
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
      },
        "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "python-app_policy" {
  name        = "my_example_policy"
  description = "Example IAM policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "arn:aws:s3::${app_bucket}/*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "example_attachment" {
  role       = aws_iam_role.python-app_role
  policy_arn = aws_iam_policy.python-app_policy
}