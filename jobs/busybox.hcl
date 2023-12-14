job "busybox" {
  datacenters = ["dc1"]

  group "web" {
    count = 1

    task "busybox" {
      driver = "docker"

      config {
        image = "busybox"
      }

      resources {
        cpu    = 512 # 0.5 CPU cores
        memory = 256 # 256MB RAM
      }
    }
  }
}