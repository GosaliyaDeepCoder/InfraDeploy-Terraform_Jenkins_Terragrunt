include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/network"
}

dependency "west_rg" {
    config_path = "../west_rg"
    mock_outputs = {
      rg_name  = "west_rg_dev_mock"
      location = "West Europe"
    }
}

inputs = {
  rg_name           = dependency.west_rg.outputs.rg_name
  location          = dependency.west_rg.outputs.location
  vnet_name         = "vnet-westus-dev"
  public_ip_name    = "ip-westus-dev"
  domain_name       = "ipwestusdev"
}

