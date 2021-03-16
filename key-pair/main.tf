
resource "tls_private_key" "ssh_keypair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "buffalo-ec2-key"
  public_key = "${tls_private_key.ssh_keypair.public_key_openssh}"
}

output keypair {
    value = aws_key_pair.generated_key.key_name
}

output public-tls_private_key {
    value = tls_private_key.ssh_keypair
}