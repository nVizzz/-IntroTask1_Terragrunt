include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "github.com/nVizzz/IntroTask1_Terraform.git//modules/iam?ref=v0.0.23"
}
inputs = {
  name = "cloudx"
  policy = <<EOF
{
	"Statement": [
		{
			"Action": [
				"ec2:Describe*",
				"ecr:GetAuthorizationToken",
				"ecr:BatchCheckLayerAvailability",
				"ecr:GetDownloadUrlForLayer",
				"ecr:BatchGetImage",
				"logs:CreateLogStream",
				"logs:PutLogEvents",
				"ssm:GetParameter*",
				"secretsmanager:GetSecretValue",
				"kms:Decrypt",
				"elasticfilesystem:DescribeFileSystems",
				"elasticfilesystem:ClientMount",
				"elasticfilesystem:ClientWrite"
			],
			"Effect": "Allow",
			"Resource": "*"
		}
	],
	"Version": "2012-10-17"
}
EOF
  role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com",
                    "ecs-tasks.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}
