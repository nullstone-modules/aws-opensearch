output "domain_arn" {
  value       = aws_elasticsearch_domain.this.arn
  description = "string ||| ARN of the OpenSearch domain"
}

output "domain_endpoint" {
  value       = aws_elasticsearch_domain.this.endpoint
  description = "string ||| The endpoint URL to submit index, search, and data upload requests"
}

output "domain_security_group_id" {
  value       = aws_security_group.this.id
  description = "string ||| The ID of the security group attached to the domain"
}
