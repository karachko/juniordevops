terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
  keep_locally = true


}

# Create a container
resource "docker_container" "nginx-server" {
  image = docker_image.nginx.latest
  name  = "nginx-server"
  ports {
    internal =80
    external = 32324
  }



}