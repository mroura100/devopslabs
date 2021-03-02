variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU 
}

variable "master_vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D2_v3" # 8 GB, 2 CPU
}


variable "vms" {
  type = list(string)
  description = "Máquinas virtuales a crear"
  default = ["worker01","worker02","nfs"]
}

