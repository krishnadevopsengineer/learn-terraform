data "aws_ami" "ami" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "Centos-*"
  owners           = ["973714476881"]
}

output "ami" {
  value = data.aws_ami.ami
}