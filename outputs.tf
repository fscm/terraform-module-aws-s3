#
# Outputs for the S3 endpoint service association terraform module.
#
# Copyright 2016-2021, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

output "id" {
  description = "The ID of the S3 endpoint."
  sensitive   = false
  value       = "${aws_vpc_endpoint.s3.id}"
}

output "state" {
  description = "The state of the VPC endpoint."
  sensitive   = false
  value       = "${aws_vpc_endpoint.s3.state}"
}
