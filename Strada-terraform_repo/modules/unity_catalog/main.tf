resource "databricks_metastore" "main" {
  name         = "${var.environment}-metastore"
  storage_root = "abfss://metastore@${var.storage_account_name}.dfs.core.windows.net/"
  force_destroy = true
}

resource "databricks_metastore_assignment" "workspace_binding" {
  workspace_id         = var.databricks_workspace_id
  metastore_id         = databricks_metastore.main.id
  default_catalog_name = "main"
}

resource "databricks_catalog" "team_catalog" {
  name         = "${var.environment}_team"
  metastore_id = databricks_metastore.main.id
  comment      = "Catalog for ${var.environment} data team"
}

resource "databricks_schema" "analytics_schema" {
  name         = "analytics"
  catalog_name = databricks_catalog.team_catalog.name
  comment      = "Schema for analytics workloads"
}

resource "databricks_grants" "catalog_permissions" {
  catalog = databricks_catalog.team_catalog.name

  grant {
    principal  = "data-team-group"
    privileges = ["USE_CATALOG"]
  }
}

resource "databricks_grants" "schema_permissions" {
  schema  = databricks_schema.analytics_schema.name
  catalog = databricks_catalog.team_catalog.name

  grant {
    principal  = "data-team-group"
    privileges = ["USE_SCHEMA", "SELECT", "MODIFY"]
  }
}

resource "databricks_storage_credential" "abfs_cred" {
  name = "${var.environment}-abfs-cred"
  azure_managed_identity {
    access_connector_id = var.access_connector_id
  }
}

resource "databricks_external_location" "data_lake" {
  name            = "${var.environment}-data-lake"
  url             = "abfss://data@${var.storage_account_name}.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.abfs_cred.name
}
