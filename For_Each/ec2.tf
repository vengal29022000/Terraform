resource "aws_instance" "vm-1" {
  for_each      = var.instances
  ami           = var.ami_id
  instance_type = each.value
  tags = {
    Name    = each.key
    purpose = "Terraform practice"
  }
  vpc_security_group_ids = [aws_security_group.vm-1-sg.id]
}
#if you print ouput of block it give as dictionary (key and value).In count we get in form of list
resource "aws_security_group" "vm-1-sg" {
  name        = "Allow-all-terraform"
  description = "allows all protocols"
  tags = {
    name = "Allows-all-traffic"
  }
  egress {
    from_port   = var.form_port
    to_port     = var.to_port
    protocol    = "-1" #if you want to specify particuraly ex:protocol = "tcp"
    cidr_blocks = var.cidr_blocks
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #Allows all network(tcp,ssh,etc)
    cidr_blocks = ["0.0.0.0/0"]
  }
}

