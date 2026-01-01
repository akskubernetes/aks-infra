locals {
  common_tags = {
    Env = "dev"
    App = "todo-aks"
  }
}

module "resource_group" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.resource_groups
  tags            = local.common_tags
}

module "azurerm_container_registry" {
  source               = "../../modules/azure_container_registry"
  container_registries = var.container_registries
  tags                 = local.common_tags
  depends_on           = [module.resource_group]
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
  tags       = local.common_tags
  depends_on = [module.resource_group]
}

module "virtual_network" {
  source           = "../../modules/azurerm_virtual_network"
  virtual_networks = var.virtual_networks
  tags             = local.common_tags
  depends_on       = [module.resource_group]
}

module "mssql_servers" {
  source        = "../../modules/azurerm_mssql_server"
  mssql_servers = var.mssql_servers
  tags          = local.common_tags
  depends_on    = [module.resource_group]
}

module "mssql_databases" {
  source          = "../../modules/azurerm_mssql_db"
  mssql_databases = var.mssql_databases
  tags            = local.common_tags
  depends_on      = [module.mssql_servers]
}

module "application_gateway" {
  source               = "../../modules/azurerm_application_gateway"
  application_gateways = var.application_gateways
  tags                 = local.common_tags
  depends_on           = [module.public_ip, module.virtual_network]
}

module "aks" {
  source              = "../../modules/azurerm_kubernetes_service"
  kubernetes_clusters = var.kubernetes_clusters
  tags                = local.common_tags
  depends_on          = [ module.azurerm_container_registry]
}



# data "azuread_users" "azure_users" {
#   user_principal_names = ["abhishekdsharma04@omkarsingh88422gmail.onmicrosoft.com"]
# }

# output "object_id" {
#   value = data.azuread_users.azure_users.users[0].object_id
# }
