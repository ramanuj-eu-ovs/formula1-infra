module "naming_container_registry" {
  source = "./modules/naming"
  prefix = [var.prefix]
  suffix = [var.project_name, "acr", var.environment]
}

module "naming_vnet" {
  source = "./modules/naming"
  prefix = [var.prefix]
  suffix = [var.project_name, "vnet", var.environment]
}

/* module "naming_github_runner" {
  source = "./modules/naming"
  prefix = [var.prefix]
  suffix = [var.project_name, "gr", var.environment]
} */