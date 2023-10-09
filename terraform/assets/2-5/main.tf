resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2004-lts"
}
resource "yandex_compute_instance" "platform" {
  name        = "${local.project}-${local.env}-${local.product}-web"
  platform_id = var.wm_web_platform_id
  resources {
    cores         = var.wm_web_cores
    memory        = var.wm_web_memory
    core_fraction = var.wm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.wm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.wm_web_nat
  }

  metadata = {
    serial-port-enable = var.wm_web_serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_compute_instance" "platform-2" {
  name        = "${local.project}-${local.env}-${local.product}-db"
  platform_id = var.wm_db_platform_id
  resources {
    cores         = var.wm_db_cores
    memory        = var.wm_db_memory
    core_fraction = var.wm_db_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.wm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.wm_db_nat
  }

  metadata = {
    serial-port-enable = var.wm_db_serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
