#outputs.tf
output "public_ip_id" { 
    value = azurerm_public_ip.ip.id 
}
