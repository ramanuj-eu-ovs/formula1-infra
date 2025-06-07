 locals {
 spark_conf = {
    "spark.sql.extensions" : "org.apache.sedona.viz.sql.SedonaVizExtensions,org.apache.sedona.sql.SedonaSqlExtensions"
    "spark.serializer" : "org.apache.spark.serializer.KryoSerializer"
    "spark.kryo.registrator" : "org.apache.sedona.core.serde.SedonaKryoRegistrator"
  }
  roles_config  = "./env/${var.environment}/roles/roles.yml"
  databricks_compute_autotermination_minutes = var.databricks_compute_autotermination_minutes
 }