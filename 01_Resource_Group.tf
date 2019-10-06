resource "azurerm_resource_group" "projectMain" {
	name = "${var.project}-resources"
	location = "uksouth"
}
