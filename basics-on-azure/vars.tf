// where to launch our resource (western europe)
variable "location" {
  type = string
  default = "westeurope"
}

variable "prefix" {
  type = string
  default = "demo"
}

variable "ssh-resource-address" {
  type = string
//  this is used as the source IP address for SSH-ing into the VM in security group (firewall)
//  only from this IP address I can log in to my VM, we override this in terraform.tfvars - this file is also in .gitignore by standard
  default = "*"
}

// We can override these variables in a file terraform.tfvars
