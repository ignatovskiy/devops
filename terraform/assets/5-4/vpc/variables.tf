variable "env_name" {
  type = string
  default = "develop"
}

variable "subnet_zones" {
  type = string
  default = "ru-central1-a"
}

variable "v4_cidr_blocks" {
  type = list(object({ zone=string,cidr=string }))
  default = [{ zone="ru-central1-a",cidr="10.0.1.0/24" }]
}
