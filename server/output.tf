/*
output "public_ip" {
  value = aws_instance.web.*.public_ip
}

output "public_dns" {
  value = aws_instance.web.*.public_dns
}
*/

output "public_ip" {
  description = "Public IP of the Servers"
  value = { for p in sort(keys(var.servers)) : p => aws_instance.web[p].public_ip }
}

output "public_dns" {
  description = "Public DNS names of the Servers"
  value = { for p in sort(keys(var.servers)) : p => aws_instance.web[p].public_dns }
}