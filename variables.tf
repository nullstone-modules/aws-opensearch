variable "opensearch_version" {
  type        = string
  default     = "1.1"
  description = "Specify the version of OpenSearch to be used for this domain."
}

variable "dedicated_master_count" {
  type        = number
  default     = 0
  description = "The number of dedicated master nodes. Valid values are 0, 3, or 5."
  validation {
    condition     = contains([0, 3, 5], var.dedicated_master_count)
    error_message = "Dedicated Master Count must be 0, 3, or 5."
  }
}

variable "dedicated_master_type" {
  type        = string
  default     = "r6gd.large.elasticsearch"
  description = "Instance type used for the dedicated master nodes."
}

variable "instance_count" {
  type        = number
  default     = 1
  description = <<EOF
The number of instance nodes to distribute the load. If more than 1 node is provisioned, they will be spread across availability zones.
The number of availability zones will be either 2 or 3. It will be set to the lesser of two values: instance count and subnet count.
EOF
}

variable "instance_type" {
  type        = string
  default     = "r6gd.large.elasticsearch"
  description = "Instance type used for the instance nodes."
}
