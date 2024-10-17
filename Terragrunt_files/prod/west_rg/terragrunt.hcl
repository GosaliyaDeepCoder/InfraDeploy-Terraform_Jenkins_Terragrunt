include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/resource_grp"
}

inputs = {
  rg_name              = "west_rg-prod"
  location             = "West Europe"
}

