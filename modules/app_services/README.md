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
| [azurerm_app_service_source_control.sourcecontrol](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/app_service_source_control) | resource |
| [azurerm_linux_web_app.webapp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app) | resource |
| [azurerm_service_plan.appserviceplan](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_service_name"></a> [app\_service\_name](#input\_app\_service\_name) | Name for the App Service | `string` | n/a | yes |
| <a name="input_app_service_plan_name"></a> [app\_service\_plan\_name](#input\_app\_service\_plan\_name) | Name for the App Service Plan | `string` | n/a | yes |
| <a name="input_branch"></a> [branch](#input\_branch) | Branch of the Git repository | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the resource group | `string` | n/a | yes |
| <a name="input_repo_url"></a> [repo\_url](#input\_repo\_url) | URL of the Git repository | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name for the resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the web app. |
| <a name="output_webapp_name"></a> [webapp\_name](#output\_webapp\_name) | The default hostname of the web app. |
<!-- END_TF_DOCS -->