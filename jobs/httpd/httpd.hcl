job "httpd-job" {
  #datacenters = ["dc1"]
  type = "service"

  group "web" {
    count = 1

    network {
      port "http" {
        to = "80"
      }
    }

    service {
      # This tells Consul to monitor the service on the port
      # labelled "http". Since Nomad allocates high dynamic port
      # numbers, we use labels to refer to them.
      port = "http"
      tags = ["web"]

        check {
          type     = "tcp"
          interval = "10s"
          timeout  = "2s"
        }
    }

    task "httpd" {
      driver = "docker"

      config {
        image = "httpd:latest"
        ports = ["http"]
      }

      resources {
        cpu    = 500  # CPU resources in MHz
        memory = 256  # Memory resources in MB
      }
    }
  }
}