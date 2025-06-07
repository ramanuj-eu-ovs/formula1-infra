output "id" {
  value = module.databricks.id
}

output "workspace_id" {
  value = module.databricks.workspace_id
}

output "workspace_url" {
  value = module.databricks.workspace_url
}

output "default_cluster_id" {
  value = databricks_cluster.small.id
}
