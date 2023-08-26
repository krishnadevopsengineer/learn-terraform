variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "security_groups" {
  default = [ "sg-06e8755bb8e15ec5f" ]
}

variable "instance_type" {
  default = "t3.small"
}

variable "zone_id" {
  default = "Z097721113XEYK6TSSVN8"
}

variable "components" {
  default = {
    frontend = {}
    catalogue = {}
    mongodb = {}
    user = {}
    redis = {}
    cart = {}
    mysql = {}
    shipping = {}
    payment = {}
    rabbitmq = {}
  }
}

//resource "aws_instance" "instance" {
//  for_each = var.components
//  ami           = var.ami
//  instance_type = var.instance_type
//  vpc_security_group_ids = var.security_groups

//  tags = {
//    Name = lookup(var.components, each.key, null )
//  }
//}

output "test" {
  value = lookup(var.components, "frontend", "null")
}

//resource "aws_route53_record" "record" {
//  zone_id = var.components
//  name    = "frontend-dev.kdevops72.online"
//  type    = "A"
//  ttl     = 30
//  records = [lookup(aws_instance.instance, each.key[""]]
//}

//output "instances" {
//  value = aws_instance.instance
//}