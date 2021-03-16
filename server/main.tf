/*
resource "aws_instance" "web" {
  count                  = 2
  ami                    = (var.server_os == "ubuntu") ? data.aws_ami.ubuntu.image_id : data.aws_ami.windows.image_id
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    "Identity"    = var.identity
    "Name"        = "Student ${count.index + 1}/${var.num_webs}"
    "Environment" = "Training"
  }
}
*/

resource "aws_instance" "web" {
  for_each               = var.servers
  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.vpc_security_group_ids
  key_name               = var.key

  tags = {
    "Identity"    = var.identity
    "Name"        = each.key
    "Environment" = each.value.environment
  }
}