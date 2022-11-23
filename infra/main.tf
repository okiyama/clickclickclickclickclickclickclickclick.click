terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }

    bitwarden = {
      source  = "maxlaverse/bitwarden"
      version = ">= 0.1.1"
    }
  }
  required_version = ">= 1.0.2"
}

variable "server_ip" {
  type = string
  description = "IP of server to use as host"
  sensitive = true
}

variable "bw_password" {
  type        = string
  description = "Bitwarden Master Key"
  sensitive   = true
}

variable "bw_client_id" {
  type        = string
  description = "Bitwarden Client ID"
  sensitive   = true
}

variable "bw_client_secret" {
  type        = string
  description = "Bitwarden Client Secret"
  sensitive   = true
}

provider "docker" {
  host     = "ssh://root@${var.server_ip}:22"
  ssh_opts = ["-o", "StrictHostKeyChecking=no", "-o", "UserKnownHostsFile=/dev/null"]
}

provider "bitwarden" {
  master_password = var.bw_password
  client_id       = var.bw_client_id
  client_secret   = var.bw_client_secret
  email           = "lamabuny@gmail.com"
  server          = "https://vault.bitwarden.com"
}

#plex
#qbittorrent w/ vueTorrent
#tautlli
#jackett
#nginx let's encrypt reverse proxy -> clickclick
#nginx let's encrypt reverse proxy -> writeshite

#Eventually:
#CI/CD per project
#provider for "website with the stuff I use"
#git host
#regular backups of hard drive files - very heavy, rsync + cron?

#clickclick: hand-built docker image in this directory:
  #Elixir App open port: unique
    #TOTP service
    #Bandit + Plug for serving API
      #Business logic in a shared place in code, not necessarily a shared process
  #kafka

resource "plex" "debian" {
  name = "debian:latest"
}

resource "docker_image" "clickclick" {
  name = "clickclick:latest"
}

resource "docker_container" "clickclick" {
  image = docker_image.clickclick.id
  name  = "https://clickclickclickclickclickclickclickclickclickclickclick.click/"
}