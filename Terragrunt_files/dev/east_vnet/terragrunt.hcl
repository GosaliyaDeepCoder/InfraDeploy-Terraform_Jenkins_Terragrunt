include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/network"
}
dependency "east_rg" {
    config_path = "../east_rg"
    mock_outputs = {
      rg_name  = "east_rg_dev_mock"
      location = "East US 2"
    }
}

inputs = {
  rg_name           = dependency.east_rg.outputs.rg_name
  location          = dependency.east_rg.outputs.location
  vnet_name         = "vnet-eastus-dev"
  public_ip_name    = "ip-eastus-dev"
  domain_name       = "ipeastusdev"
}

