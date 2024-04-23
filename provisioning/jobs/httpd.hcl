job "httpd-job" {
  datacenters = ["dc1"]
  type = "service"

  group "web" {
    count = 1

    network {
      port "http" {
        static = 80
      }
    }

    service {
      # This tells Consul to monitor the service on the port
      # labelled "http". Since Nomad allocates high dynamic port
      # numbers, we use labels to refer to them.
      port = "http"

      check {
        type     = "http"
        path     = "/health"
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