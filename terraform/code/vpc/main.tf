resource "yandex_vpc_subnet" "develop" {
  name = "${var.env_name}-${var.v4_cidr_blocks[0].zone}"

  network_id = yandex_vpc_network.develop.id
  zone = var.v4_cidr_blocks[0].zone

  v4_cidr_blocks = [var.v4_cidr_blocks[0].cidr]
}

resource "yandex_vpc_network" "develop" {
  name = "${var.env_name}-${var.v4_cidr_blocks[0].zone}"
}