resource "yandex_vpc_network" "network_1" {
  name = "kittygram-network"
}

resource "yandex_vpc_subnet" "subnet_1" {
  name           = "kittygram-subnet"
  zone           = var.zone
  network_id     = yandex_vpc_network.network_1.id
  v4_cidr_blocks = ["10.129.1.0/24"]
}

resource "yandex_vpc_security_group" "kittygram-sg" {
  name        = "kittygram-sg"
  network_id  = yandex_vpc_network.network_1.id

  ingress {
    protocol       = "TCP"
    description    = "Allow SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "TCP"
    description    = "Allow HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }

  egress {
    protocol       = "ANY"
    description    = "Allow any outgoing traffic"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}