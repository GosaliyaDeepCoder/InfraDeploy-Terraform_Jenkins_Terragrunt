<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_application_gateway.app_gateway](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_fqdn"></a> [app\_service\_fqdn](#input\_app\_service\_fqdn) | FQDN of the App Service to be used in the Application Gateway configuration | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the Application Gateway | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name for the Application Gateway | `string` | n/a | yes |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID of the Public IP for the Application Gateway | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name for the Resource Group | `string` | n/a | yes |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | ID of the VNet Subnet for the Application Gateway | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->