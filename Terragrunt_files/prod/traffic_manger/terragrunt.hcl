include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/traffic_manager"
}
dependency "east_network" {
    config_path = "../east_vnet"
    mock_outputs = {
      subnet_id  = "id_mock"
      public_ip_id= "pubid_mock"
    }
}
dependency "west_network" {
    config_path = "../west_vnet"
    mock_outputs = {
      subnet_id  = "id_mock"
      public_ip_id= "pubid_mock"
    }
}
dependency "traffic_rg" {
    config_path = "../traffic_manager_rg"
    mock_outputs = {
      rg_name  = "traffic_rg_prod_mock"
      location = "East US 2"
    }
}
inputs = {
  name                      = "traffic-profile1937-prod"
  rg_name                   = dependency.traffic_rg.outputs.rg_name
  location                  = dependency.traffic_rg.outputs.location
  name                      = "traffic-profile1937-prod"
  profile_name              = "traffic-profile1937-prod"
  ttl                       = 100
  monitor_protocol          = "HTTPS"
  monitor_port              = 443
  monitor_path              = "/"
  monitor_interval          = 30
  monitor_timeout           = 10
  monitor_failures          = 2
  primary_target_resource_id = dependency.east_network.outputs.public_ip_id
  secondary_target_resource_id = dependency.west_network.outputs.public_ip_id
}

