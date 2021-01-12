// demo instance definition
resource "azurerm_virtual_machine" "demo-instance" {
  name = "${var.prefix}-vm" # use variable from the file in this way if we need to concatenate values
  location = var.location # if reading just the variable we can get it in a simple way

//  azure offers a lot of variables to access here, we have to specify resource group name to create the resource within this resource group, this is defined
//  by us in main.tf
  resource_group_name = azurerm_resource_group.demo.name
  network_interface_ids = [azurerm_network_interface.demo-instance.id]
  vm_size = "Standard_A1_v2"

//  because this is a demo - we want to delete its contents on termination to avoid payment :)
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

//  definition of the image used to define the storage
  storage_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "16.04-LTS"
    version = "latest"
  }

  storage_os_disk {
    name = "myosdisk1"
    create_option = "FromImage"
    caching = "ReadWrite"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name = "demo-instance"
    admin_username = "demo"
//    admin_password = "" disabled in the line below -> we will use ssh key
  }

  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
      key_data = file("../ssh-keys/mykey.pub")
      //  location of the ssh key in the actual VM in azure - we will put the key in there during creation,
//      do not put comments inline with the path - it breaks the terraform/azure will complain about non-default path
//    , but show only the one being there
      path = "/home/demo/.ssh/authorized_keys"
    }
  }
}


resource "azurerm_network_interface" "demo-instance" {
  name = "${var.prefix}-instance1"
  location = var.location
  resource_group_name = azurerm_resource_group.demo.name
//  security group is a firewall
  network_security_group_id = azurerm_network_security_group.allow-ssh.id

//  The ip configuration will give us a dynamic private ip address and a public IP address from azurerm_public_ip
  ip_configuration {
    name = "instance1"
    subnet_id = azurerm_subnet.demo-internal-1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.demo-instance.id
  }
}

// This adds a public ip address in location same as whole group
resource "azurerm_public_ip" "demo-instance" {
  name = "instance1-public-ip"
  location = var.location
  resource_group_name = azurerm_resource_group.demo.name
  allocation_method = "Dynamic"
}