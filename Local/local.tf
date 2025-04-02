locals {
  ami_id = data.aws_ami.joindevops-ami.id
  instance_type = "t3.small"
  me_bio = "${var.name}.${var.role}.${var.comapany}" # we can concat in local but not possible in varible.tf
}