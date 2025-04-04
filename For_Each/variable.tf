variable "ami_id" {
    type=string
    default = "ami-09c813fb71547fc4f"
}
variable "tags" {
    type =map
    default = {
        Name = "terraform-vm"
        project = "dev"
    }  
}
variable "form_port" {
  type = number
  default = 0
}
variable "to_port" {
  type = number
  default = 0
}
variable "cidr_blocks" {
  type = list
  default = ["0.0.0.0/0"]
}
variable "instance_type" {
  type = string
  default = "t3.micro"
}


variable "instances" {
  type = map
  default = {
    frontend = "t3.micro"
    backend = "t3.micro"
    database = "t3.small"
  } 
}
variable "domain_name" {
  default = "vengalareddy.site" 
}
variable "zone_id" {
  default = "Z0657771OQQ6V4STFY4E"
}