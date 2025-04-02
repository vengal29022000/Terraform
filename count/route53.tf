resource "aws_route53_record" "dns" {
  count   = length(var.name)
  zone_id = "Z0657771OQQ6V4STFY4E"
  name    = "${var.name[count.index]}.${var.domain_name}" #interpolation(adding two names)
  type    = "A"
  ttl     = 1
  records = var.name[count.index] == "backend" || var.name[count.index] == "database" ? [aws_instance.vm-1[count.index].private_ip] : [aws_instance.vm-1[count.index].public_ip] #ip address
  allow_overwrite = true
}