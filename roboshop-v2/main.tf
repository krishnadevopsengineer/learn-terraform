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
    frontend = { name = "frontend-dev"}
    catalogue = { name = "catalogue-dev"}
    mongodb = { name = "mongodb-dev" }
    user = { name = "user-dev" }
    redis = { name = "redis-dev"}
    cart = { name = "cart-dev" }
    mysql = { name = "mysql-dev" }
    shipping = { name = "shipping-dev"}
    payment = { name = "payment-dev" }
    rabbitmq = { name = "rabbitmq-dev" }
  }
}

resource "aws_instance" "instance" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = lookup(each.value, "name", null )
  }
}


resource "aws_route53_record" "record" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${lookup(each.value, "name", null )}.kdevops72.online"
  type    = "A"
  ttl     = 30
  records = [lookup(lookup(aws_instance.instance, each.key, null), "private_ip", null) ]
}