# OpenSearch Domain

This module is used to create and manage an AWS OpenSearch Domain (successor to Elasticsearch).

## Security & Compliance

Security scanning is graciously provided by Bridgecrew. Bridgecrew is the leading fully hosted, cloud-native solution providing continuous Terraform security and compliance.

![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-opensearch/general)
![CIS AWS V1.3](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-opensearch/cis_aws_13)
![PCI-DSS V3.2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-opensearch/pci)
![NIST-800-53](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-opensearch/nist)
![ISO27001](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-opensearch/iso)
![SOC2](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-opensearch/soc2)
![HIPAA](https://www.bridgecrew.cloud/badges/github/nullstone-modules/aws-opensearch/hipaa)

## Service-Linked Role

This module requires a service-linked role created in your AWS account.
This cannot be created by this module because only one can exist per account.

To do this, you can use the following command:
```shell
aws iam create-service-linked-role --aws-service-name opensearchservice.amazonaws.com
```

Alternatively, from the console, go to AWS IAM Roles > Create Role > Choose AWS Service > OpenSearch Service.
