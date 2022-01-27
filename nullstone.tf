terraform {
  required_providers {
    ns = {
      source = "nullstone-io/ns"
    }
  }
}

data "ns_workspace" "this" {}

data "ns_connection" "network" {
  name = "network"
  type = "network/aws"
}

locals {
  tags = data.ns_workspace.this.tags
}
