include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/app_gateway"
}
dependency "east_network" {
    config_path = "../east_vnet"
    mock_outputs = {
      subnet_id  = "id_mock"
      public_ip_id= "pubid_mock"
    }
}
dependency "east_webapp" {
    config_path = "../east_webapp"
    mock_outputs = {
      webapp_name = "webapp_mock"
    }
}
dependency "east_rg" {
    config_path = "../east_rg"
    mock_outputs = {
      rg_name  = "east_rg_prod_mock"
      location = "East US"
    }
}
inputs = {
  name                 = "app-gateway-eastus-prod"
  rg_name              = dependency.east_rg.outputs.rg_name
  location             = dependency.east_rg.outputs.location
  vnet_subnet_id       = dependency.east_network.outputs.subnet_id
  public_ip_id         = dependency.east_network.outputs.public_ip_id
  app_service_fqdn     = dependency.east_webapp.outputs.webapp_name
}

