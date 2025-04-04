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
variable "from_port" {
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

variable "ingress_ports" {
  default = [
    {
      from_port =80
      to_port =80
      protocol="tcp"
      cidr_blocks=["0.0.0.0/24"]
    },
    {
      from_port =8080
      to_port =8080
      protocol="tcp"
      cidr_blocks=["0.0.0.0/24"]
    },
    {
      from_port =3306
      to_port =3306
      protocol="tcp"
      cidr_blocks=["0.0.0.0/24"]
    } 
  ]
  
}