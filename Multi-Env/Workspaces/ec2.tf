resource "aws_instance" "vm-1" {
  count         = 3 # it interates resources block 3 times
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "${var.name[count.index]}.${terraform.workspace}"
  }
  vpc_security_group_ids = [aws_security_group.vm-1-sg.id]
}
resource "aws_security_group" "vm-1-sg" {
  name        = "Allow-all-terraform.${terraform.workspace}"
  description = "allows all protocols"
  tags = {
    name = "Allows-all-traffic.${terraform.workspace}"
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

