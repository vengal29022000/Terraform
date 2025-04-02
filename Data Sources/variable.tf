variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}
variable "tags" {
  type = map(any)
  default = {
    Name    = "terraform-vm"
    project = "dev"
  }
}
variable "form_port" {
  type    = number
  default = 0
}
variable "to_port" {
  type    = number
  default = 0
}
variable "cidr_blocks" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
variable "instance_type" {
  type    = string
  default = "t3.micro"
}