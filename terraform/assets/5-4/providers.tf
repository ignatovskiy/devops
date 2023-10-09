terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex",
      version = ">=0.95.0"
    }
    template = {
      source = "hashicorp/template"
      version = "<=2.2.0"
    }
  }
  required_version = ">=0.13"

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket = "tfstate-develop-ignatovsky"
    region = "ru-central1"
    key = "terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    dynamodb_table = "tflock-develop"
    dynamodb_endpoint = "https://docapi.serverless.yandexcloud.net/ru-central1/b1gc3746j3o6s295l6ai/etnpl780gpu6dgfs27g2"
}
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}
