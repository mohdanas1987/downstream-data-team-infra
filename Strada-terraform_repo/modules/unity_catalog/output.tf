output "metastore_id" {
  value = databricks_metastore.main.id
}

output "catalog_name" {
  value = databricks_catalog.team_catalog.name
}

output "schema_name" {
  value = databricks_schema.analytics_schema.name
}

output "external_location_url" {
  value = databricks_external_location.data_lake.url
}
