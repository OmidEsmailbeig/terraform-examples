terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

variable "nginx_containers" {
  default = {
    "nginx1" = "nginx"
    "nginx2" = "nginx"
    "nginx3" = "nginx"
    "nginx4" = "nginx"
  }
}

data "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx" {
  for_each = var.nginx_containers
  name     = each.key
  image    = data.docker_image.nginx.name
}
