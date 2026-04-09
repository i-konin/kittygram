# Создаем саму сеть
resource "yandex_vpc_network" "network_1" {
  name = "kittygram-network"
}

# Создаем подсеть ВНУТРИ этой сети
resource "yandex_vpc_subnet" "subnet_1" {
  name           = "kittygram-subnet"
  zone           = var.aws_region # Убедись, что регион тот же, что у ВМ
  network_id     = yandex_vpc_network.network_1.id
  v4_cidr_blocks = ["10.129.1.0/24"] # Любой свободный диапазон
}