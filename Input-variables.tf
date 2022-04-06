# Generic Input Variables
# Business Division
variable "business_divsion" {
  description = "Business Division of this infra"
  type        = string
  default     = "Globant"
}
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type        = string
  default     = "dev"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-default"
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "eastus"
}

# Virtual Network, Subnets and Subnet NSG's

## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet-default"
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Application Gateway Subnet Name
variable "ag_subnet_name" {
  description = "Virtual Network Application Gateway Subnet Name"
  type        = string
  default     = "agsubnet"
}
# Application Gateway Subnet Address Space
variable "ag_subnet_address" {
  description = "Virtual Network Application Gateway Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

# App Subnet Name
variable "app_subnet_name" {
  description = "Virtual Network App Subnet Name"
  type        = string
  default     = "appsubnet"
}
# App Subnet Address Space
variable "app_subnet_address" {
  description = "Virtual Network App Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

# Database Subnet Name
variable "db_subnet_name" {
  description = "Virtual Network Database Subnet Name"
  type        = string
  default     = "dbsubnet"
}
# Database Subnet Address Space
variable "db_subnet_address" {
  description = "Virtual Network Database Subnet Address Spaces"
  type        = list(string)
  default     = ["10.0.3.0/24"]
}

#Input variables for storage account

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}
variable "storage_account_tier" {
  description = "Storage Account Tier"
  type        = string
}
variable "storage_account_replication_type" {
  description = "Storage Account Replication Type"
  type        = string
}
variable "storage_account_kind" {
  description = "Storage Account Kind"
  type        = string
}
