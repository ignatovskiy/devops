resource "yandex_compute_instance" "web" {
    count = 2
    name = "web-${count.index + 1}"

    resources {
        cores         = 2
        memory        = 1
        core_fraction = 5
    }
    boot_disk {
        initialize_params {
            image_id = data.yandex_compute_image.ubuntu.image_id
            size = 5
        }
    }
    scheduling_policy {
        preemptible = true
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = true
        security_group_ids = [
            yandex_vpc_security_group.example.id
        ]
    }

    metadata = {
        serial-port-enable = 1
        ssh-keys           = "ubuntu:${local.ssh_key}"
    }

}