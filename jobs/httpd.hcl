job "httpd" {
  datacenters = ["dc1"]

  group "web" {
    count = 1

    task "httpd" {
      driver = "docker"

      config {
        image = "httpd"
      }

      resources {
        cpu    = 512 # 0.5 CPU cores
        memory = 256 # 256MB RAM
      }
    }
  }
}