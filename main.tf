resource "azurerm_resource_group" "default" {
  name     = "test-tfcloud-rg"
  location = "westus 2"
}

resource "azurerm_container_group" "ghost" {
  name                = "ghost"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_name_label      = "mtcden-test-tfcloud"
  ip_address_type     = "public"
  os_type             = "linux"

  container {
    name   = "ghost-blog"
    image  = "ghost:alpine"
    cpu    = "0.5"
    memory = "1.0"
    ports {
      port     = 2368
      protocol = "TCP"
    }
  }
}