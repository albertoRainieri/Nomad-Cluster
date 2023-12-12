job "httpd" {
  datacenters = ["dc1"]

  group "web" {
    count = 1

    task "httpd" {
      driver = "docker"

      config {
        image = "httpd:latest"
        ports = [80]
      }

      resources {
        cpu    = 500 # 0.5 CPU cores
        memory = 256 # 256MB RAM
      }
    }

    service {
      name = "httpd"
      port = "http"

      check {
        type     = "http"
        path     = "/"
        interval = "10s"
        timeout  = "2s"
      }
    }
  }
}