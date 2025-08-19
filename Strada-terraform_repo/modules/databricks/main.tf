resource "azurerm_databricks_workspace" "this" {
  name                = var.databricks_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.databricks_sku
}
