provider "aws" {

}

variable "AWS_REGION" {
  type = string
  default = "eu-west-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "my ami"
  }
}

resource "aws_instance" "example1" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}

resource "aws_instance" "example2" {
  ami = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
}
