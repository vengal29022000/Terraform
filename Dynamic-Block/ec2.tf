resource "aws_instance" "vm-1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  tags                   = var.tags
  vpc_security_group_ids = [aws_security_group.vm-1-sg.id]
}
resource "aws_security_group" "vm-1-sg" {
  name        = "Allow-all-terraform"
  description = "allows all protocols"
  tags = {
    name = "Allows-all-traffic"
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1" #if you want to specify particuraly ex:protocol = "tcp"
    cidr_blocks      = var.cidr_blocks
  }
  dynamic "ingress" {
    for_each = var.ingress_ports
    content {
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      = ingress.value["cidr_blocks"]
   }
  }
} 
  
