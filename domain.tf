locals {
  // we figure out the number of zones we should have
  // if possible we always want to spread across as many availability zones
  // if the number of instances or number of private subnets is less than 2 then there is nothing to spread
  zone_count = min(var.instance_count, length(local.private_subnet_ids), 3)
}

resource "aws_iam_service_linked_role" "this" {
  aws_service_name = "es.amazonaws.com"
}

resource "aws_elasticsearch_domain" "this" {
  domain_name           = local.resource_name
  tags                  = local.tags
  elasticsearch_version = "OpenSearch_${var.opensearch_version}"

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"
  }

  encrypt_at_rest {
    enabled = true
  }

  cluster_config {
    dedicated_master_enabled = var.dedicated_master_count != 0
    dedicated_master_count   = var.dedicated_master_count
    dedicated_master_type    = var.dedicated_master_type

    instance_count = var.instance_count
    instance_type  = var.instance_type

    zone_awareness_enabled = local.zone_count > 1
    zone_awareness_config {
      availability_zone_count = local.zone_count > 1 ? local.zone_count : null
    }
  }

  vpc_options {
    security_group_ids = [aws_security_group.this.id]
    subnet_ids         = slice(local.private_subnet_ids, 0, var.instance_count)
  }

  depends_on = [aws_iam_service_linked_role.this]
}
