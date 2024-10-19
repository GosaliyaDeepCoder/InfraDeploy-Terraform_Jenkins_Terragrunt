include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/resource_grp"
}

inputs = {
  rg_name              = "east_rg-preprod"
  location             = "East US 2"
}

