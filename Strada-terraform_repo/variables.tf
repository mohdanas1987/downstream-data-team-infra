variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "environment_name" {
  description = "Environment name used for resource naming"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "westeurope"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-data-dev"
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {
    owner       = "data-team"
    managed_by  = "terraform"
    environment = "dev"
  }
}

# Networking
variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
  default     = "vnet-data-dev"
}

variable "subnet_names" {
  description = "List of subnet names"
  type        = list(string)
  default     = ["subnet-app", "subnet-db", "subnet-integration"]
}

# Storage
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "stdataappdev"
}

variable "storage_account_tier" {
  description = "Storage account performance tier"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication" {
  description = "Replication type for the storage account"
  type        = string
  default     = "LRS"
}

# Key Vault
variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
  default     = "kv-data-dev"
}

# SQL Server
variable "sql_server_name" {
  description = "Name of the SQL Server"
  type        = string
  default     = "sql-data-dev"
}

variable "sql_admin_login" {
  description = "SQL Server admin login"
  type        = string
  default     = "sqladmin"
}

variable "sql_admin_password" {
  description = "SQL Server admin password"
  type        = string
  default     = "Password@123"
  sensitive   = true
}

# Data Factory
variable "data_factory_name" {
  description = "Name of the Data Factory"
  type        = string
  default     = "df-data-dev"
}

# Databricks
variable "databricks_workspace_name" {
  description = "Name of the Databricks workspace"
  type        = string
  default     = "dbw-data-dev"
}

variable "databricks_sku" {
  description = "SKU for Databricks workspace"
  type        = string
  default     = "premium"
}

# Unity Catalog
variable "databricks_workspace_id" {
  description = "ID of the Databricks workspace"
  type        = string
}

variable "access_connector_id" {
  description = "Access connector ID for managed identity used in Unity Catalog"
  type        = string
}

# Azure Service Principal Credentials (from pipeline)
variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
