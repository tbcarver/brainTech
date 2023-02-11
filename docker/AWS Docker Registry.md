configure a profile 
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html
`aws configure --profile myprofile`

use profile
https://stackoverflow.com/questions/49716583/how-to-temporarily-switch-profiles-for-aws-cli
`export AWS_PROFILE=myprofile`

test credentials
`aws sts get-caller-identity`

login to docker
https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html
`aws ecr get-login-password --region **region** | docker login --username AWS --password-stdin **aws_account_id**.dkr.ecr.**region**.amazonaws.com`