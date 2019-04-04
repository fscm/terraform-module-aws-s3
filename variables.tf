#
# Variables for the S3 endpoint service association terraform module.
#
# Copyright 2016-2019, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

variable "private_route_tables" {
  description = "List of the private Route Table Identifiers to be associated with the S3 Endpoint."
  default     = "[]"
  type        = "list"
}

variable "public_route_tables" {
  description = "List of the public Route Table Identifiers to be associated with the S3 Endpoint."
  default     = []
  type        = "list"
}

variable "vpc_id" {
  description = "The ID of the VPC in which the S3 endpoint will be used."
  default     = ""
  type        = "string"
}
