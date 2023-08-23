variable "fruits" {
  default = ["apple" , "banana"]
}

output "fruit_name" {
  value = var.fruits[2]
}