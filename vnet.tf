terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.93.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "06623748-2737-476a-8ef9-6f686e128b74"
  client_id       = "ce5d8a37-f03b-4058-9f78-1b6c1707d980"
  client_secret   = "eCo8Q~h24PQp0wx_vpj4fMV2GOB39vx2MaM3ncO_"
  tenant_id       = "0f664dbc-7ae4-45c2-a0d8-dae817e2d82a"
  features {}
}


locals {
  resource_group="app-grp"
  location="North Europe"
}

resource "azurerm_resource_group" "app_grp"{
  name=local.resource_group
  location=local.location
}

resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = local.location
  resource_group_name = azurerm_resource_group.app_grp.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "SubnetA"
    address_prefix = "10.0.1.0/24"
  }  
}