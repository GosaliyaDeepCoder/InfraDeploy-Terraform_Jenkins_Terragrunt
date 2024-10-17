#variables.tf

variable "rg_name" {
  description = "Name for the resource group"
  type        = string
}

variable "location" {
  description = "Location for the resource group"
  type        = string
}
