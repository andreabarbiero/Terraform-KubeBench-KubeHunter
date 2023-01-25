resource "kubernetes_job" "kube_hunter" {
  metadata {
    name = "kube-hunter"
    namespace = "security"
  }

  spec {
    template {
      metadata {
        labels = {
          app = "kube-hunter"
        }
      }

      spec {
        container {
          name    = "kube-hunter"
          image   = "aquasec/kube-hunter:0.6.8"
          command = ["kube-hunter"]
          args    = ["--pod"]
        }

        restart_policy = "Never"
      }
    }
  }
}

