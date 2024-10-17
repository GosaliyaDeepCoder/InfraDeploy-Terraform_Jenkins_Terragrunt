include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/app_services"
}

dependency "west_rg" {
    config_path = "../west_rg"
    mock_outputs = {
      rg_name  = "West_rg_prod_mock"
      location = "West Europe"
    }
}

inputs = {
  rg_name               = dependency.west_rg.outputs.rg_name
  location              = dependency.west_rg.outputs.location
  app_service_plan_name = "WestServicePlan-prod"
  app_service_name      = "WestWebApp-prod"
  repo_url              = "https://github.com/GosaliyaDeepCoder/WebApplication.git"
  branch                = "master"
}

