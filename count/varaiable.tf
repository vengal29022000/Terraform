variable "ami_id" {
    type=string
    default = "ami-09c813fb71547fc4f"
}
variable "name" {
    type =list(string)
    default =["front-end","backend","database"]
        
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