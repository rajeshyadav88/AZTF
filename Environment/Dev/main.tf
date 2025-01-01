module "rg" {
  source = "../../Module/azurerm_resource_group"
}
module "vnet" {
  source = "../../Module/azurerm_virtual_network"
  depends_on = [ module.rg ]

}
module "snet" {
  source = "../../Module/azurerm_subnet"
  depends_on = [ module.vnet ]

}
module "pip" {
  source = "../../Module/azurerm_public_ip"
  depends_on = [ module.rg ]
  
}
module "nic" {
  source = "../../Module/azurerm_network_interface"
  depends_on = [ module.pip, module.snet ]
}
module "kv" {
  source = "../../Module/azurerm_key_vault"
  depends_on = [ module.rg, module.pip ]
  
}
module "vm" {
  source = "../../Module/azurerm_virtual_machine"
  depends_on = [ module.nic, module.kv ]
  
}
module "nsg" {
  source = "../../Module/azurerm_network_security_group"
  depends_on = [ module.vm ]
  
}