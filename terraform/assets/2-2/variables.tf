###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

variable "wm_web_name" {
  type = string
  default = "netology-develop-platform-web"
}

variable "wm_web_platform_id" {
  type = string
  default = "standard-v1"
}

variable "wm_web_cores" {
  type = number
  default = 2
}

variable "wm_web_memory" {
  type = number
  default = 1
}

variable "wm_web_core_fraction" {
  type = number
  default = 5
}

variable "wm_web_preemptible" {
  type = bool
  default = true
}

variable "wm_web_nat" {
  type = bool
  default = true
}

variable "wm_web_serial_port_enable" {
  type = number
  default = 1
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMmEUbzjzf9uKJCsN5gOuIgGnM2JJHWGYYhvSg2OIT8m hackerman@hackermans-MacBook-Air.local"
  description = "ssh-keygen -t ed25519"
}
