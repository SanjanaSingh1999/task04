variable "rg_name" {
  description = "The name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "The location of the Azure Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Azure Virtual Network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the Azure Subnet"
  type        = string
}

variable "public_ip_name" {
  description = "The name of the Azure Public IP"
  type        = string
}

variable "dns_label" {
  description = "The DNS label for the Public IP"
  type        = string
}

variable "nsg_name" {
  description = "The name of the Azure Network Security Group"
  type        = string
}

variable "nic_name" {
  description = "The name of the Azure Network Interface"
  type        = string
}

variable "vm_name" {
  description = "The name of the Azure Virtual Machine"
  type        = string
}

variable "vm_sku" {
  description = "The SKU size of the Azure Virtual Machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "vm_password" {
  description = "The password for the admin user"
  type        = string
  sensitive   = true
}

variable "creator_email" {
  description = "The creator's email address"
  type        = string
}

variable "source_ip_addresses" {
  description = "The allowed source IPs for security rules"
  type        = list(string)
}

variable "image_publisher" {
  description = "The publisher for the VM image"
  type        = string
}

variable "image_offer" {
  description = "The offer for the VM image"
  type        = string
}

variable "image_sku" {
  description = "The SKU for the VM image"
  type        = string
}

variable "image_version" {
  description = "The version of the VM image"
  type        = string
}

variable "storage_account_type" {
  description = "The storage account type for the VM disk"
  type        = string
}

# Adding rule names for HTTP and SSH
variable "allow_http_rule_name" {
  description = "The name for the HTTP security rule"
  type        = string
  default     = "AllowHTTP"
}

variable "allow_ssh_rule_name" {
  description = "The name for the SSH security rule"
  type        = string
  default     = "AllowSSH"
}
