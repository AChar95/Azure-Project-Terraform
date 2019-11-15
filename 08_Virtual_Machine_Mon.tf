resource "azurerm_virtual_machine" "mongodb" {
	name = "${var.name}-vm"
	location = "${azurerm_resource_group.projectMain.location}"
	resource_group_name = "${azurerm_resource_group.projectMain.name}"
	network_interface_ids = ["${azurerm_network_interface.jenkins.id}"]
	vm_size = "Standard_B1S"

	storage_image_reference {
		publisher = "Canonical"
		offer = "UbuntuServer"
		sku = "16.04-LTS"
		version = "latest"
	}
	storage_os_disk {
		name = "myosdisk1"
		caching = "ReadWrite"
		create_option = "FromImage"
		managed_disk_type = "Standard_LRS"
	}
	os_profile {
		computer_name = "mongoVM"
		admin_username = "mongodb"
	}
	os_profile_linux_config {
		disable_password_authentication = true
		ssh_keys {
			path = "/home/mongodb/.ssh/authorized_keys"
			key_data = "${file("/home/allan/.ssh/id_rsa.pub")}"
		}
	}
	tags = {
		environment = "staging"
	}
	provisioner "remote-exec" {
		inline = ["sudo apt update", "sudo apt install -y jq", "sudo apt install mongodb", "sudo systemctl start mongodb"]
	}
}