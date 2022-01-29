data "aws_caller_identity" "this" {}

data "aws_iam_policy_document" "this" {
  statement {
    sid     = "AllowAllCallers"
    effect  = "Allow"
    actions = ["es:*"]
    principals {
      identifiers = ["*"]
      type        = "*"
    }
    resources = [
      "arn:aws:es:${data.aws_region.this.name}:${data.aws_caller_identity.this.account_id}:domain/${local.resource_name}/*"
    ]
  }
}
