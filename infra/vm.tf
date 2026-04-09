resource "yandex_compute_instance" "vm_1" {
  name = "kittygram-vm"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd80on0ma1ic60hees6n" # Ubuntu 24.04 LTS
      size = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_1.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.kittygram-sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file("./kitty_key.pub")}" 
  }
}