output "ip" {
  value = aws_eip.EIP.public_ip
}

output "vpc" {
    value = aws_vpc.default.id
}