terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}

  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  use_oidc        = true
}

module "databricks" {
  source                    = "./modules/databricks"
  environment               = var.environment
  tenant_id                 = var.tenant_id
  subscription_id           = var.subscription_id
  client_id                 = var.client_id
  databricks_workspace_name = var.databricks_workspace_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  databricks_sku            = var.databricks_sku
}

module "datafactory" {
  source              = "./modules/datafactory"
  environment         = var.environment
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  client_id           = var.client_id
  data_factory_name   = var.data_factory_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "keyvault" {
  source              = "./modules/keyvault"
  environment         = var.environment
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  client_id           = var.client_id
  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "sql" {
  source              = "./modules/sql"
  environment         = var.environment
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  client_id           = var.client_id
  sql_server_name     = var.sql_server_name
  sql_admin_login     = var.sql_admin_login
  sql_admin_password  = var.sql_admin_password
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "storage" {
  source                      = "./modules/storage"
  environment                 = var.environment
  tenant_id                   = var.tenant_id
  subscription_id             = var.subscription_id
  client_id                   = var.client_id
  storage_account_name        = var.storage_account_name
  storage_account_tier        = var.storage_account_tier
  storage_account_replication = var.storage_account_replication
  location                    = var.location
  resource_group_name         = var.resource_group_name
}

module "networking" {
  source              = "./modules/networking"
  environment         = var.environment
  tenant_id           = var.tenant_id
  subscription_id     = var.subscription_id
  client_id           = var.client_id
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = var.vnet_name
  subnet_names        = var.subnet_names
}

module "unity_catalog" {
  source                  = "./modules/unity_catalog"
  environment             = var.environment
  databricks_workspace_id = var.databricks_workspace_id
  storage_account_name    = var.storage_account_name
  access_connector_id     = var.access_connector_id
}
