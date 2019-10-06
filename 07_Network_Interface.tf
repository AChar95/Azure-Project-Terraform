resource "azurerm_network_interface" "mongodb" {
	name = "${var.name}-nic-1"
	location = "${azurerm_resource_group.projectMain.location}"
	resource_group_name = "${azurerm_resource_group.projectMain.name}"
	network_security_group_id = "${azurerm_network_security.main.id}"

	ip_configuration {
		name = "mongodb"
		subnet_id = "${azurerm_subnet.internal.id}"
		private_ip_address_allocation = "Dynamic"
	}
	depends_on = [azurerm_network_security_group.main, azurerm_subnet.internal]

	tags = {
		environment = "staging"
	}
}

	resource "azurerm_network_interface" "api" {
        name = "${var.name1}-nic-1"
        location = "${azurerm_resource_group.projectMain.location}"
        resource_group_name = "${azurerm_resource_group.projectMain.name}"
        network_security_group_id = "${azurerm_network_security.main.id}"

        ip_configuration {
                name = "api"
                subnet_id = "${azurerm_subnet.internal.id}"
                private_ip_address_allocation = "Dynamic"
        }
	depends_on = [azurerm_network_security_group.main, azurerm_subnet.internal]

        tags = {
                environment = "staging"
        }
}

resource "azurerm_network_interface" "angular" {
        name = "${var.name2}-nic-1"
        location = "${azurerm_resource_group.projectMain.location}"
        resource_group_name = "${azurerm_resource_group.projectMain.name}"
        network_security_group_id = "${azurerm_network_security.main.id}"

        ip_configuration {
                name = "angular"
                subnet_id = "${azurerm_subnet.internal.id}"
                private_ip_address_allocation = "Dynamic"
		public_ip_address_id = "${azurerm_public_ip.angular.id}"
        }

	depends_on = [azurerm_network_security_group.main, azurerm_subnet.internal, azurerm_public_ip.angular]
        tags = {
                environment = "staging"
        }
}

resource "azurerm_network_interface" "Jenkins" {
        name = "${var.name3}-nic-1"
        location = "${azurerm_resource_group.projectMain.location}"
        resource_group_name = "${azurerm_resource_group.projectMain.name}"
        network_security_group_id = "${azurerm_network_security.main.id}"

        ip_configuration {
                name = "Jenkins"
                subnet_id = "${azurerm_subnet.internal.id}"
                private_ip_address_allocation = "Dynamic"
		public_ip_address_id = "${azurerm_public_ip.jenkins.id}"
        }

	depends_on = [azurerm_network_security_group.main, azurerm_subnet.internal, azurerm_public_ip.jenkins]

        tags = {
                environment = "staging"
        }
}



