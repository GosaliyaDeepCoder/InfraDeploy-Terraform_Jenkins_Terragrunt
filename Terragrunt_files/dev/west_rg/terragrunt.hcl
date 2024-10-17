include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/resource_grp"
}

inputs = {
  rg_name              = "west_rg-dev"
  location             = "West Europe"
}

