terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatesdev1"
    container_name       = "tfstate"
    key                  = "${env}.tfstate"
  }
}
