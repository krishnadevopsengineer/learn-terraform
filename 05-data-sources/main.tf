data "aws_ami" "example" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "Centos-*"
  owners           = ["973714476881"]

}