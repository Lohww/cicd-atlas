resource "aws_instance" "tf-instance-1" {
  ami               = "ami-050cd642fd83388e4"
  availability_zone = "us-east-2a"
  instance_type     = "t2.micro"
  key_name          = "VM1-key"

  tags = {
    Name = "tf-instance-1"
  }

}

resource "aws_iam_user" "tf-user-1" {
  name = "DreamTeam"
}

resource "aws_iam_user" "tf-user-2" {
  name = "Admin"
}

resource "aws_iam_group" "tf-group-1" {
  name = "tfgroup"
}

resource "aws_iam_group_membership" "tf-group-mem-1" {
  name = "tf-group-mem"
  users = [
    aws_iam_user.tf-user-1.name,
    aws_iam_user.tf-user-2.name
  ]
  group = aws_iam_group.tf-group-1.name
}