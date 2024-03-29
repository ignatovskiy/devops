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
  description = "VPC network&subnet name"
}

variable "vm_for_each" {
  type = list(object({ vm_name=string, cpu=number, ram=number, disk=number, core_fraction=number, preemptible=bool, nat=bool }))
  default = [{
    cpu = 2
    disk = 5
    ram = 2
    core_fraction = 5
    vm_name = "replica"
    preemptible = true
    nat = true
  }, {
    cpu = 4
    disk = 10
    ram = 4
    core_fraction = 5
    vm_name = "main"
    preemptible = true
    nat = true
  }
  ]
}