variable access_key {
  sensitive = true
}
variable secret_key {
  sensitive = true
}
variable server_os {
    type = string
    description = "Server Operating System"
    default = "ubuntu"
}

variable subnet_id {}

variable vpc_security_group_ids {}

variable "servers" {
  description = "Map of server types to configuration"
  type        = map(any)
}