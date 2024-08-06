output "prod_ip_address" {
  value = aws_instance.prod_server.public_ip
}