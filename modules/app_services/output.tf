#output
output "webapp_name" {
  value       = azurerm_linux_web_app.webapp.default_hostname
  description = "The default hostname of the web app."
}
output "id" {
  value       = azurerm_linux_web_app.webapp.id
  description = "The ID of the web app."
}
