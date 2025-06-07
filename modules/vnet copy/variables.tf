variable "vnet_name" {
  type = string
}

variable "nsg_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vnet_range" {
  type = string
}

variable "subnets" {
  type = map(object({
    prefixes          = list(string),
    service_endpoints = optional(list(string), []),
    delegation        = optional(object({ name = string, actions = list(string) }))
  }))
  default = {}
}
