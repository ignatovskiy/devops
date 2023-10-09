variable "vms_resources" {
    type = map(map(number))
    default = {
        web = {
            cores = 2,
            memory = 1,
            core_fraction = 5
        },
        db = {
            cores = 2,
            memory = 2,
            core_fraction = 20
        }
    }
}

variable "vms_metadata" {
    type = map(any)
    default = {
        serial_port_enable = 1,
        ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMmEUbzjzf9uKJCsN5gOuIgGnM2JJHWGYYhvSg2OIT8m hackerman@hackermans-MacBook-Air.local"
    }
}

variable "wm_web_platform_id" {
  type = string
  default = "standard-v1"
}

variable "wm_web_preemptible" {
  type = bool
  default = true
}

variable "wm_web_nat" {
  type = bool
  default = true
}

variable "wm_db_platform_id" {
  type = string
  default = "standard-v1"
}

variable "wm_db_preemptible" {
  type = bool
  default = true
}

variable "wm_db_nat" {
  type = bool
  default = true
}
