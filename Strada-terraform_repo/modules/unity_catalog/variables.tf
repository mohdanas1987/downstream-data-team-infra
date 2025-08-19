variable "environment" {
  description = "Deployment environment (e.g., dev, tst, prd)"
  type        = string
}

variable "databricks_workspace_id" {
  description = "Databricks workspace ID"
  type        = string
}

variable "storage_account_name" {
  description = "Azure Storage account name"
  type        = string
}

variable "access_connector_id" {
  description = "Access connector ID for managed identity"
  type        = string
}
