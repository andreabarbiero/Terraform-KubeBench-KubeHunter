terraform {
    required_providers {
        kubernetes = {
        source = "hashicorp/kubernetes"
        version = "2.16.1"
        }
    }
}

provider "kubernetes" {
    config_path    = "~/.kube/config"
}