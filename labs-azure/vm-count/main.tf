# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# crea un service principal y rellena los siguientes datos para autenticar
provider "azurerm" {
  features {}
  subscription_id = "ec98687b-8da7-4660-a9cb-ab62d80dcd52"
  client_id       = "05e9d8cb-35dd-44d3-a17d-4969abc78d4d" # appID
  client_secret   = "Td9899JKhv2E0-1cG6PGxrR-t4CE89NTJc"   # password
  tenant_id       = "899789dc-202f-44b4-8472-a6d40f9eb440" # tenant
}
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group

resource "azurerm_resource_group" "rg" {
    name     =  "kubernetes_rg"
    location = var.location

    tags = {
        environment = "CP2"
    }

}

# Storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account

resource "azurerm_storage_account" "stAccount" {
    name                     = "mrourastorage" 
    resource_group_name      = azurerm_resource_group.rg.name
    location                 = azurerm_resource_group.rg.location
    account_tier             = "Standard"
    account_replication_type = "LRS"

    tags = {
        environment = "CP2"
    }

}
