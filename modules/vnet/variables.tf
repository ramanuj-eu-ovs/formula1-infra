variable "vnet_name" {
  description = "The name of the vnet"
  type        = string
}

variable "nsg_name" {
  description = "The name of the network security group to associate to all subnets"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group to deploy the vnet into"
  type        = string
}

variable "location" {
  description = "The region to deploy the vnet into"
  type        = string
}

variable "tags" {
  description = "Optional, tags to add to the vnet"
  type        = map(string)
  default     = {}
}

variable "vnet_range" {
  description = "The address range of the vnet"
  type        = string
}

variable "subnets" {
  description = "The subnets to create in the vnet"
  type = map(object({
    prefixes          = list(string),
    service_endpoints = optional(list(string), []),
    delegation        = optional(object({ name = string, actions = list(string) }))
  }))
  default = {}
}

variable "private_dns_zones" {
  description = "A list of private DNS zones to create and associate to the vnet"
  type        = list(string)
  default     = []
}