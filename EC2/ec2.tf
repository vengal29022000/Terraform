resource "aws_instance" "vm-1" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  tags = {
    name = "ec2-terraform"
  } 
}

resource "aws_security_group" "vm-1-sg" {
  name = "Allow-all"
  description = "allows all protocols"
  tags = {
    name = "Allows-all-traffic"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #if you want to specify particuraly ex:protocol = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #Allows all network(tcp,ssh,etc)
    cidr_blocks      = ["0.0.0.0/0"]
  }
} 
  
