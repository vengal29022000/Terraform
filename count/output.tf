# output "vm" {
#     value = aws_instance.vm-1
# }
output "frontend_public_ip" {
  value = aws_instance.vm-1[0].public_ip
}
output "backend_private_ip" {
  value = aws_instance.vm-1[1].private_ip
}
output "database_private_ip" {
  value = aws_instance.vm-1[2].private_ip
}