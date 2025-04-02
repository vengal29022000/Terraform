#data source is uesd to query the data of an existing resource from the provider"we can use the data in creating resource
data "aws_ami" "joindevops-ami" {
  most_recent = true

  owners = ["973714476881"]
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

output "ami_id" {
  value = data.aws_ami.joindevops-ami.id
}

data "aws_vpc" "default-vpc" {
  default = true
}
output "default-vpc" {
  value = data.aws_vpc.default-vpc.id

}
