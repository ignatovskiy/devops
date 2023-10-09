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

variable "ip_address" {
  type        = string
  description = "ip-адрес"
  default = "192.168.0.1"

  validation {
    condition     = can(regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.ip_address))
    error_message = "Неверный адрес."
  }
}

variable "ip_address_list" {
  type        = list(string)
  description = "список ip-адресов"
  default = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]

  validation {
    condition     = can(alltrue([for addr in var.ip_address_list : regex("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", addr)]))
    error_message = "Неверный адрес."
  }
}
