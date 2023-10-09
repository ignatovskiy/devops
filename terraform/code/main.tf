module "vpc" {
  source       = "./vpc"
  subnet_zones = "ru-central1-a"
  v4_cidr_blocks = [{ zone="ru-central1-a",cidr="10.0.1.0/24" }]
  env_name = "develop"
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=95c286e0062805d5ba5edb866f387247bc1bbd44"
  env_name        = "develop"
  network_id      = module.vpc.network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = module.vpc.subnet_id
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered
      serial-port-enable = 1
  }

}

data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")

 vars = {
  public_key_ssh = local.ssh_key
 }
}



