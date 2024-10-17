include {
  path = find_in_parent_folders()
}
terraform {
    source = "../../../modules/resource_grp"
}

inputs = {
  rg_name              = "traffic_mnager_rg-preprod"
  location             = "Central US"
}

