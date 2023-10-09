resource "yandex_compute_disk" "disk" {
  count = 3
  name = "disk-${count.index}"
  size = 1
}

resource "yandex_compute_instance" "disk_vm" {
    name = "storage"

    resources {
        cores         = 2
        memory        = 2
        core_fraction = 5
    }
    boot_disk {
        initialize_params {
            size = 5
            image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }

    dynamic "secondary_disk"{
        for_each = { for disk in yandex_compute_disk.disk:
            disk.name => disk
        }
        content {
            disk_id = secondary_disk.value.id
        }
    }

    scheduling_policy {
        preemptible = true
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = true
    }

    metadata = {
        serial-port-enable = 1
        ssh-keys           = "ubuntu:${local.ssh_key}"
    }

}