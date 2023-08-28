variable "security_groups" {
  default = [ "sg-06e8755bb8e15ec5f" ]
}

variable "zone_id" {
  default = "Z097721113XEYK6TSSVN8"
}

variable "components" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.micro"
    }
    cart = {
      name = "cart"
      instance_type = "t3.micro"
    }

  }
}