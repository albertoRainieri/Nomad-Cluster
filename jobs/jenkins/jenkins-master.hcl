variable "image" {
  type = string
  default = "jenkins-master:1.0.0"
}

job "jenkins-master" {
  datacenters = ["dc1"]
  type = "service"

  group "jenkins" {
    count = 1

    network {
      port "http" {
        to = "8080"
      }

      port "jnlp" {
        to = "50000"
      }
    }

    service {
      # This tells Consul to monitor the service on the port
      # labelled "http". Since Nomad allocates high dynamic port
      # numbers, we use labels to refer to them.
      port = "http"
      tags = ["jenkins-master"]

        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
    }

    service {
      # This tells Consul to monitor the service on the port
      # labelled "http". Since Nomad allocates high dynamic port
      # numbers, we use labels to refer to them.
      port = "jnlp"
      tags = ["jenkins-master-jnlp"]

        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
    }

    task "jenkins-master" {
      driver = "consul"

      config {
        image = var.image
        ports = ["http", "jnlp"]
      }

      resources {
        cpu    = 500  # CPU resources in MHz
        memory = 256  # Memory resources in MB
      }
    }
  }
}