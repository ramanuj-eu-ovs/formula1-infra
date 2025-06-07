output "volume_paths" {
  value = tomap({
    for volume in databricks_volume.this :
    volume.name => "/Volumes/${volume.catalog_name}/${volume.schema_name}/${volume.name}"
  })
}