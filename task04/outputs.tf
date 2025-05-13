output "vm_public_ip" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.this.ip_address
}

output "vm_fqdn" {
  description = "The Fully Qualified Domain Name (FQDN) of the VM"
  value       = azurerm_public_ip.this.dns_name
}
