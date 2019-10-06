resource "azurerm_public_ip" "mongodb" {
	name = "${var.name}-publicIP"
	location = "${azurerm_resources_group.projectMain.location}"
	resource_group_name = "${azurerm_resource_group.projectMain.name}"
	allocation_method = "Dynamic"
	domain_name_label = "pool1-${formatdate("DDMMYYhhmmss", timestamp())}"
	tags = {
		environment = "database"
	}
}
