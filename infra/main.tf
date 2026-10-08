terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "build" {
  name = "tp-terraform-app:latest"

  build {
    context = "${path.module}/../app"
  }
}

resource "docker_container" "container" {
  name  = "tp-terraform-app"
  image = docker_image.build.image_id

  ports {
    internal = 8000
    external = 8000
  }
}