# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

variable "location" {
  type        = string
  description = "Location of the resource group and modules"
  default = null
}

variable "prefix" {
  type        = string
  description = "Prefix for module names"
  default = null
}

variable "environment" {
  type        = string
  description = "Environment information"
  default = null
}

variable "postfix" {
  type        = string
  description = "Postfix for module names"
  default = null
}

variable "enable_aml_computecluster" {
  type        = string
  description = "Variable to enable or disable AML compute cluster"
  default = null
}

variable "enable_monitoring" {
  type = string
  description = "Variable to enable or disable Monitoring"
  default = null
}

variable "client_secret" {
  type = string
  description = "Service Principal Secret"
  default = null
}
