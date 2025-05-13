variable "vm_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
}

variable "dns_label" {
  description = "The DNS name label for the public IP"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
}

variable "nic_name" {
  description = "The name of the network interface"
  type        = string
}

variable "vm_sku" {
  description = "The SKU for the Virtual Machine"
  type        = string
}

variable "location" {
  description = "The Azure location for all resources"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}
