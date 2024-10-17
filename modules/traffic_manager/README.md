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
| [azurerm_traffic_manager_azure_endpoint.primary_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_azure_endpoint) | resource |
| [azurerm_traffic_manager_azure_endpoint.secondary_endpoint](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_azure_endpoint) | resource |
| [azurerm_traffic_manager_profile.traffic_profile](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/traffic_manager_profile) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_monitor_failures"></a> [monitor\_failures](#input\_monitor\_failures) | Number of tolerated failures for monitoring | `number` | n/a | yes |
| <a name="input_monitor_interval"></a> [monitor\_interval](#input\_monitor\_interval) | Interval in seconds for monitoring | `number` | n/a | yes |
| <a name="input_monitor_path"></a> [monitor\_path](#input\_monitor\_path) | Path used for monitoring | `string` | n/a | yes |
| <a name="input_monitor_port"></a> [monitor\_port](#input\_monitor\_port) | Port used for monitoring | `number` | n/a | yes |
| <a name="input_monitor_protocol"></a> [monitor\_protocol](#input\_monitor\_protocol) | Protocol used for monitoring | `string` | n/a | yes |
| <a name="input_monitor_timeout"></a> [monitor\_timeout](#input\_monitor\_timeout) | Timeout in seconds for monitoring | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Relative name for DNS configuration | `string` | n/a | yes |
| <a name="input_primary_target_resource_id"></a> [primary\_target\_resource\_id](#input\_primary\_target\_resource\_id) | ID of the primary target resource (e.g., App Service) | `string` | n/a | yes |
| <a name="input_profile_name"></a> [profile\_name](#input\_profile\_name) | Name of the Traffic Manager profile | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_secondary_target_resource_id"></a> [secondary\_target\_resource\_id](#input\_secondary\_target\_resource\_id) | ID of the secondary target resource (e.g., App Service) | `string` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | Time to live for DNS records | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->