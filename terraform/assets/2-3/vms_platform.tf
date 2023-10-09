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

variable "wm_db_name" {
  type = string
  default = "netology-develop-platform-db"
}

variable "wm_db_platform_id" {
  type = string
  default = "standard-v1"
}

variable "wm_db_cores" {
  type = number
  default = 2
}

variable "wm_db_memory" {
  type = number
  default = 2
}

variable "wm_db_core_fraction" {
  type = number
  default = 20
}

variable "wm_db_preemptible" {
  type = bool
  default = true
}

variable "wm_db_nat" {
  type = bool
  default = true
}

variable "wm_db_serial_port_enable" {
  type = number
  default = 1
}
