# Declare all variables for the Terraform script
variable "rg_name" {
  type        = string
  description = "Name of the existing Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region where the resources will be created"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the Subnet within the Virtual Network"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP"
}

variable "dns_label" {
  type        = string
  description = "DNS label for the Public IP"
}

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "nic_name" {
  type        = string
  description = "Name of the Network Interface Card (NIC)"
}

variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "vm_sku" {
  type        = string
  description = "SKU size for the Virtual Machine"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the Linux VM"
}

variable "vm_password" {
  type        = string
  description = "Password for the Linux VM admin user"
}

variable "creator_tag" {
  type        = string
  description = "Tag value for the creator of the resources"
}

variable "AllowHTTP" {
  type        = string
  description = "Name of the HTTP NSG rule"
}

variable "AllowSSH" {
  type        = string
  description = "Name of the SSH NSG rule"
}
