resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { webservers =  yandex_compute_instance.web
      databases = yandex_compute_instance.web_for_each
      storages = [yandex_compute_instance.disk_vm]    }  )

  filename = "${abspath(path.module)}/hosts.cfg"
}


resource "null_resource" "web_hosts_provision" {
depends_on = [yandex_compute_instance.web, yandex_compute_instance.web_for_each, yandex_compute_instance.disk_vm]

  provisioner "local-exec" {
    command = "cat ~/.ssh/yandex_key.pem | ssh-add -"
  }

 provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "local-exec" {                  
    command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/hosts.cfg ${abspath(path.module)}/test.yml"
    on_failure = continue
    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
  }
    triggers = {  
      always_run         = "${timestamp()}"
      playbook_src_hash  = file("${abspath(path.module)}/test.yml")
      ssh_public_key     = "ubuntu:${local.ssh_key}" 
    }

}
