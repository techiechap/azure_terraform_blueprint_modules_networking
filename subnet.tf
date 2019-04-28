locals {
    subnet_list = "${keys(var.subnets)}"
}

resource "azurerm_subnet" "subnets" {
    count                   = "${length(var.subnets)}"
    name                    = "${var.subnets[element(local.subnet_list, count.index)]}"
    resource_group_name     = "${var.resource_group_name}"
    virtual_network_name    = "${azurerm_virtual_network.vnet.name}"
    address_prefix          = "${lookup(var.vnet, var.subnets[element(local.subnet_list, count.index)])}"
}
