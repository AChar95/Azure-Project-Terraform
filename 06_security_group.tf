resource "azurerm_network_security_group" "main" {
	name = "projectSecurityGroup"
	location = "${azurerm_resource_group.projectMain.location}"
	resource_group_name = "${azurerm_resource_group.projectMain.name}"
	
	security_rule {
		name = "SSH"
		priorty = 200
		direction = "Inbound"
		access = "Allow"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "22"
		source_address_prefix = "*"
		destination_address_prefix = "*"
	}
	
	security_rule {
		name = "Jenkins"
		priority = 300
		direction = "Inbound"
		access = "Allow"
		protocol = "Tcp"
		source_port_range = "*"
		destination_port_range = "8080"
		source_address_prefix = "*"
		destination_address_prefix = "*"
	}
	security_rule {
                name = "UI"
                priority = 400
                direction = "Inbound"
                access = "Allow"
                protocol = "Tcp"
                source_port_range = "*"
                destination_port_range = "80"
                source_address_prefix = "*"
                destination_address_prefix = "*"
        }
	tags = {
		environment = "staging"
	}
}
