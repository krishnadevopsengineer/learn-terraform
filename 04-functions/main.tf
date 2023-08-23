variable "fruits" {
  default = ["apple" , "banana"]
}

output "fruit_name" {
  // value = var.fruits[2]
  value = element(var.fruits, 2)
}