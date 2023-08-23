# Plain Variable
variable "fruit_name" {
  default = "apple"
}

output "fruit_name" {
  value = var.fruit_name
}

# List Variable
 variable "fruits" {
   default = [
     "apple",
     "banana",
     "kiwi"
   ]
   // default = [ "apple", "banana", "kiwi"] // Single Line Syntax
 }

# Map Variable
variable "fruit_stock" {
  default = {
    apple = 100
    banana = 200
    kiwi = 400
  }
}

# Map Variable, Map of Maps
variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 3
    }
    banana = {
      stock = 200
      price = 4
    }
    kiwi = {
      stock = 400
      price = 5
    }
  }
}

# Access a List Variable, List index starts from zero
output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_second" {
  value = var.fruits[1]
}

output "fruits_third" {
  value = var.fruits[2]
}

# Access a Map Variable
output "fruit_stock_apple" {
  value = var.fruit_stock["apple"].stock
}
