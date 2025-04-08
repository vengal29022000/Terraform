resource "aws_route53_record" "dns" {
  count   = length(var.name)
  zone_id = "Z0657771OQQ6V4STFY4E"
  name    = var.name[count.index]==front-end && var.env=="Prod" ? var.domain_name:"${var.name[count.index]}-${var.env}.${var.domain_name}" 
  type    = "A" 
  ttl     = 1
  records = var.name[count.index] == "front-end" ? [aws_instance.vm-1[count.index].public_ip_ip] : [aws_instance.vm-1[count.index].private_ip] #ip address
  allow_overwrite = true
}