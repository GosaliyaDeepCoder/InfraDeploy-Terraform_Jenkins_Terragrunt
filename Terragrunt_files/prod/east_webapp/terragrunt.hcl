include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/app_services"
}
dependency "east_rg" {
    config_path = "../east_rg"
    mock_outputs = {
      rg_name  = "east_rg_prod_mock"
      location = "East US 2"
    }
}

inputs = {
  rg_name               = dependency.east_rg.outputs.rg_name
  location              = dependency.east_rg.outputs.location
  app_service_plan_name = "EastServicePlan-prod"
  app_service_name      = "EastWebApp-prod"
  repo_url              = "https://github.com/GosaliyaDeepCoder/WebApplication2.git"
  branch                = "master"
}

