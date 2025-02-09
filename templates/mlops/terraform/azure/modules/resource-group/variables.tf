# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

variable "location" {
  type        = string
  default     = "North Europe"
  description = "Location of the Resource Group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags which should be assigned to the Resource Group"
}

variable "prefix" {
  type        = string
  description = "Prefix for the module name"
}

variable "postfix" {
  type        = string
  description = "Postfix for the module name"
}

variable "env" {
  type        = string
  description = "Environment prefix"
}