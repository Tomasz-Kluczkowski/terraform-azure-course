variable "myvar" {
  type = string
  default = "hello terraform"
}

variable "mymap" {
  type = map(string)
  default = {
    "mykey" = "tom"
    "key2" = "mac"
  }
}

variable "mylist" {
  type = list(string)
  default = ["tom", "mac"]
}