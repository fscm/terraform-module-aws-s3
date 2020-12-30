#
# Terraform module to create a S3 endpoint service association to a VPC.
#
# Copyright 2016-2021, Frederico Martins
#   Author: Frederico Martins <http://github.com/fscm>
#
# SPDX-License-Identifier: MIT
#
# This program is free software. You can use it and/or modify it under the
# terms of the MIT License.
#

#
# S3 endpoint service.
#
data "aws_vpc_endpoint_service" "s3" {
  service = "s3"
}

#
# S3 endpoint.
#
resource "aws_vpc_endpoint" "s3" {
  vpc_endpoint_type = "Gateway"
  vpc_id            = "${var.vpc_id}"
  service_name      = "${data.aws_vpc_endpoint_service.s3.service_name}"
}

#
# Network routing association.
#
resource "aws_vpc_endpoint_route_table_association" "private" {
  depends_on      = ["aws_vpc_endpoint.s3"]
  count           = "${length(var.private_route_tables)}"
  route_table_id  = "${element(concat(var.private_route_tables, list("")), count.index)}"
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
}

resource "aws_vpc_endpoint_route_table_association" "public" {
  depends_on      = ["aws_vpc_endpoint.s3"]
  count           = "${length(var.public_route_tables)}"
  route_table_id  = "${element(concat(var.public_route_tables, list("")), count.index)}"
  vpc_endpoint_id = "${aws_vpc_endpoint.s3.id}"
}
