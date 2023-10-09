resource "yandex_compute_instance" "web_for_each" {
    depends_on = [ yandex_compute_instance.web ]
    for_each = {for item in var.vm_for_each: item.vm_name => item}
    name = each.value.vm_name

    resources {
        cores         = each.value.cpu
        memory        = each.value.ram
        core_fraction = each.value.core_fraction
    }
    boot_disk {
        initialize_params {
            size = each.value.disk
            image_id = data.yandex_compute_image.ubuntu.image_id
        }
    }
    scheduling_policy {
        preemptible = each.value.preemptible
    }
    network_interface {
        subnet_id = yandex_vpc_subnet.develop.id
        nat       = each.value.nat
        security_group_ids = [
            yandex_vpc_security_group.example.id
        ]
    }

    metadata = {
        serial-port-enable = 1
        ssh-keys           = "ubuntu:${local.ssh_key}"
    }

}