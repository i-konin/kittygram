# ===============
# Variables
# ===============

variable "net_cidr" {
  description = "Subnet structure"
  type = list(object({
    name   = string
    zone   = string
    prefix = string
  }))

  default = [
    { name = "infra-subnet-a", zone = "ru-central1-a", prefix = "10.129.1.0/24" }
  ]
}

variable "ssh_key" {
  description = "SSH Public Key"
  type        = string
}

variable "cloud_id" {
  description = "Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Folder ID"
  type        = string
}

variable "zone" {
  description = "Зона доступности по умолчанию"
  type        = string
  default     = "ru-central1-a"
}

variable "cores" {
  description = "Количество ядер CPU"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Объем RAM (ГБ)"
  type        = number
  default     = 4
}

variable "disk_type" {
  description = "Тип диска (network-hdd, network-ssd)"
  type        = string
  default     = "network-ssd"
}

variable "nat" {
  description = "Назначать публичный IP"
  type        = bool
  default     = true
}

variable "yc_token" {
  type = string
}