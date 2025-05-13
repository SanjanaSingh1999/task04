provider "azurerm" {
  features {}
}

# Import existing resource group
data "azurerm_resource_group" "existing" {
  name = "cmtr-5f0gvlzp-mod4-rg"
}

# Create Virtual Network
resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  address_space        = ["10.0.0.0/16"]
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
}

# Create Subnet
resource "azurerm_subnet" "frontend" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.existing.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  allocation_method   = "Static"
  dns_name            = var.dns_label
}

# Create Network Security Group (NSG)
resource "azurerm_network_security_group" "this" {
  name                = var.nsg_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "0.0.0.0/0"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "0.0.0.0/0"
    destination_address_prefix = "*"
  }
}

# Create Network Interface (NIC)
resource "azurerm_network_interface" "this" {
  name                = "cmtr-5f0gvlzp-mod4-nic"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  network_security_group_id = azurerm_network_security_group.this.id
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.frontend.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this.id
  }
}

# Create Linux Virtual Machine (VM)
resource "azurerm_linux_virtual_machine" "this" {
  name                = var.vm_name
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  size                = var.vm_sku
  admin_username      = "azureuser"
  admin_password      = var.vm_password
  network_interface_ids = [azurerm_network_interface.this.id]
  image_id            = data.azurerm_image.ubuntu.id

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
    connection {
      type        = "ssh"
      host        = azurerm_public_ip.this.ip_address
      user        = "azureuser"
      private_key = file("~/.ssh/id_rsa")
    }
  }
}

# Fetch the Ubuntu image
data "azurerm_image" "ubuntu" {
  name                = "UbuntuServer"
  resource_group_name = data.azurerm_resource_group.existing.name
  filter {
    name   = "offer"
    values = ["UbuntuServer"]
  }
}
