include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/app_gateway"
}
dependency "west_network" {
    config_path = "../west_vnet"
    mock_outputs = {
      subnet_id  = "id_mock"
      public_ip_id= "pubid_mock"
    }
}
dependency "west_webapp" {
    config_path = "../west_webapp"
    mock_outputs = {
      webapp_name = "webapp_mock"
    }
}

dependency "west_rg" {
    config_path = "../west_rg"
    mock_outputs = {
      rg_name  = "west_rg_dev_mock"
      location = "West Europe"
    }
}

inputs = {
  rg_name               = dependency.west_rg.outputs.rg_name
  location              = dependency.west_rg.outputs.location
  name                 = "app-gateway-westus-dev"
  vnet_subnet_id       = dependency.west_network.outputs.subnet_id
  public_ip_id         = dependency.west_network.outputs.public_ip_id
  app_service_fqdn     = dependency.west_webapp.outputs.webapp_name
}

