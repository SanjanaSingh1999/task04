# Resource group details
rg_name        = "cmtr-5f0gvlzp-mod4-rg"
location       = "East US"

# Network details
vnet_name      = "cmtr-5f0gvlzp-mod4-vnet"
subnet_name    = "frontend"

# Public IP details
public_ip_name = "cmtr-5f0gvlzp-mod4-pip"
dns_label      = "cmtr-5f0gvlzp-mod4-nginx"

# Network Security Group (NSG)
nsg_name       = "cmtr-5f0gvlzp-mod4-nsg"
nic_name       = "cmtr-5f0gvlzp-mod4-nic"

# Virtual Machine details
vm_name        = "cmtr-5f0gvlzp-mod4-vm"
vm_sku         = "Standard_B2s"
admin_username = "azureuser"
vm_password    = "YourSecurePassword123!"  # Ensure this meets Azure password requirements

# Required for tagging and rules
creator_tag = "sanjana_singh1@epam.com"
AllowHTTP   = "AllowHTTP"
AllowSSH    = "AllowSSH"
