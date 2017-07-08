variable "access_key" {}
variable "secret_key" {}

variable "my_home" {}

variable "region" {
    default = "eu-west-1"
}

variable "vpc_cidr" {
    default = "10.0.0.0/24"
}

variable "subnet_public_cidr" {
    default = "10.0.0.0/25"
}

variable "subnet_private_cidr" {
    default = "10.0.0.128/25"
}

variable "instance_type_micro" {
    default = "t2.micro"
}
