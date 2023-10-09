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
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
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
    serial-port-enable = var.vms_metadata.serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_metadata.ssh_key}"
  }

}

resource "yandex_compute_instance" "platform-2" {
  name        = "${local.project}-${local.env}-${local.product}-db"
  platform_id = var.wm_db_platform_id
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
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
    serial-port-enable = var.vms_metadata.serial_port_enable
    ssh-keys           = "ubuntu:${var.vms_metadata.ssh_key}"
  }

}
