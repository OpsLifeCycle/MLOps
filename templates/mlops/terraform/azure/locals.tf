# Copyright (c) Rahul Bourai. All rights reserved.
# Licensed under the PolyForm Strict License 1.0.0

locals {
  tags = {
    Owner       = "Rahul Bourai"
    Project     = "mlops"
    Environment = "${var.environment}"
    Toolkit     = "terraform"
    Name        = "${var.prefix}"
  }
}