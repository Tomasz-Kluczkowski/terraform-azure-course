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

// same as in python - set has unique elements but is also always storted
variable "myset" {
  type = set(string)
  default = ["tom", "mac", "bolo"]
}

// each element of object can be of different type
variable "myobject" {
  type = object({})
}

// tuple is like a list but each element can be of different type
variable "mytuple" {
  type = tuple([string, number])
  default = ["tom", 10]
}