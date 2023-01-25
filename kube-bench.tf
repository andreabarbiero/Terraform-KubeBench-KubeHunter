resource "kubernetes_job" "kube_bench" {
  metadata {
    name = "kube-bench"
    namespace = "security"
  }

  spec {
    template {
      metadata {
        labels = {
          app = "kube-bench"
        }
      }

      spec {
        volume {
          name = "var-lib-etcd"

          host_path {
            path = "/var/lib/etcd"
          }
        }

        volume {
          name = "var-lib-kubelet"

          host_path {
            path = "/var/lib/kubelet"
          }
        }

        volume {
          name = "var-lib-kube-scheduler"

          host_path {
            path = "/var/lib/kube-scheduler"
          }
        }

        volume {
          name = "var-lib-kube-controller-manager"

          host_path {
            path = "/var/lib/kube-controller-manager"
          }
        }

        volume {
          name = "etc-systemd"

          host_path {
            path = "/etc/systemd"
          }
        }

        volume {
          name = "lib-systemd"

          host_path {
            path = "/lib/systemd"
          }
        }

        volume {
          name = "srv-kubernetes"

          host_path {
            path = "/srv/kubernetes"
          }
        }

        volume {
          name = "etc-kubernetes"

          host_path {
            path = "/etc/kubernetes"
          }
        }

        volume {
          name = "usr-bin"

          host_path {
            path = "/usr/bin"
          }
        }

        volume {
          name = "etc-cni-netd"

          host_path {
            path = "/etc/cni/net.d/"
          }
        }

        volume {
          name = "opt-cni-bin"

          host_path {
            path = "/opt/cni/bin/"
          }
        }

        container {
          name    = "kube-bench"
          image   = "docker.io/aquasec/kube-bench:v0.6.10"
          command = ["kube-bench"]

          volume_mount {
            name       = "var-lib-etcd"
            read_only  = true
            mount_path = "/var/lib/etcd"
          }

          volume_mount {
            name       = "var-lib-kubelet"
            read_only  = true
            mount_path = "/var/lib/kubelet"
          }

          volume_mount {
            name       = "var-lib-kube-scheduler"
            read_only  = true
            mount_path = "/var/lib/kube-scheduler"
          }

          volume_mount {
            name       = "var-lib-kube-controller-manager"
            read_only  = true
            mount_path = "/var/lib/kube-controller-manager"
          }

          volume_mount {
            name       = "etc-systemd"
            read_only  = true
            mount_path = "/etc/systemd"
          }

          volume_mount {
            name       = "lib-systemd"
            read_only  = true
            mount_path = "/lib/systemd/"
          }

          volume_mount {
            name       = "srv-kubernetes"
            read_only  = true
            mount_path = "/srv/kubernetes/"
          }

          volume_mount {
            name       = "etc-kubernetes"
            read_only  = true
            mount_path = "/etc/kubernetes"
          }

          volume_mount {
            name       = "usr-bin"
            read_only  = true
            mount_path = "/usr/local/mount-from-host/bin"
          }

          volume_mount {
            name       = "etc-cni-netd"
            read_only  = true
            mount_path = "/etc/cni/net.d/"
          }

          volume_mount {
            name       = "opt-cni-bin"
            read_only  = true
            mount_path = "/opt/cni/bin/"
          }
        }

        restart_policy = "Never"
        host_pid       = true
      }
    }
  }
}

