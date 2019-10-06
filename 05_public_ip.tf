resource "azurerm_public_ip" "mongodb" {
	name = "${var.name}-publicIP"
	location = "${azurerm_resources_group.projectMain.location}"
	resource_group_name = "${azurerm_resource_group.projectMain.name}"
	allocation_method = "Dynamic"
	domain_name_label = "pool1-${formatdate("DDMMYYhhmmss", timestamp())}"
	tags = {
		environment = "staging"
	}
}
resource "azurerm_public_ip" "api" {
	name = "${var.name1}-publicIP"
	location = "${azurerm_resource_group.projectMain.location}"
	resource_group_name = "${azurerm_resource_group.projectMain.name}"
	allocation_method = "Dynamic"
	domain_name_label = "pool2-${formatdate("DDMMYYhhmmss", timestamp())}"
	tags = {
		environment = "staging"
	}
}

resource "azurerm_public_ip" "angular" {
        name = "${var.name2}-publicIP"
        location = "${azurerm_resource_group.projectMain.location}"
        resource_group_name = "${azurerm_resource_group.projectMain.name}"
        allocation_method = "Dynamic"
        domain_name_label = "pool3-${formatdate("DDMMYYhhmmss", timestamp(
))}"
        tags = {
                environment = "staging"
        }
}
resource "azurerm_public_ip" "jenkins" {
        name = "${var.name3}-publicIP"
        location = "${azurerm_resource_group.projectMain.location}"
        resource_group_name = "${azurerm_resource_group.projectMain.name}"
        allocation_method = "Dynamic"
        domain_name_label = "pool3-${formatdate("DDMMYYhhmmss", timestamp(
))}"
        tags = {
                environment = "staging"
        }
}


