## ARJ-Stack: AWS - Amazon Keyspaces (for Apache Cassandra) Terraform module

A Terraform module for provisioning a scalable, highly available, and managed Apache Cassandra–compatible database.

### Resources
This module features the following components to be provisioned with different combinations:

- Keyspaces Keyspace [[aws_keyspaces_keyspace](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/keyspaces_keyspace)]
- Keyspaces Table [[aws_keyspaces_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/keyspaces_table)]

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.22.0 |

### Examples

Refer [Configuration Examples](https://github.com/ankit-jn/terraform-aws-examples/tree/main/aws-keyspaces) for effectively utilizing this module.

### Inputs
---

| Name | Description | Type | Default | Required | Example|
|:------|:------|:------|:------|:------:|:------|
| <a name="create_keyspace"></a> [create_keyspace](#input\_create\_keyspace) | Flag to decide if Keyspace should be provisioned. | `bool` | `true` | no |  |
| <a name="keyspace_name"></a> [keyspace_name](#input\_keyspace\_name) | The name of the keyspace to be created. | `string` | `null` | no |  |
| <a name="keyspace_tables"></a> [keyspace_tables](#keyspace\_table) | The List of Map for Keyspace tables configurations | `any` | `[]` | no |  |
| <a name="default_tags"></a> [default_tags](#input\_default\_tags) | A map of tags to assign to all the resources. | `map(string)` | `{}` | no |  |

### Nested Configuration Maps:  

#### keyspace_table

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="name"></a> [name](#input\_name) | The name of the Keyspace table. | `string` |  | yes |
| <a name="comments"></a> [comments](#input\_comments) | A description of the table. | `string` | `Name of the table` | no |
| <a name="thoughput_mode"></a> [thoughput_mode](#input\_thoughput\_mode) | The read/write throughput capacity mode for a table. | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="read_capacity_units"></a> [read_capacity_units](#input\_read\_capacity\_units) | The throughput capacity specified for read operations defined in read capacity units (RCUs). | `number` | `null` | no |
| <a name="write_capacity_units"></a> [write_capacity_units](#input\_write\_capacity\_units) | The throughput capacity specified for write operations defined in write capacity units (WCUs). | `number` | `null` | no |
| <a name="default_time_to_live"></a> [default_time_to_live](#input\_default\_time\_to\_live) | The default Time to Live setting in seconds for the table. | `number` | `0` | no |
| <a name="enable_ttl"></a> [enable_ttl](#input\_enable\_ttl) | Flag to decide if enable TTL custom setting on the table. | `bool` | `false` | no |
| <a name="enable_point_in_time_recovery"></a> [enable_point_in_time_recovery](#input\_enable_point\_in\_time\_recovery) | Flag to decide if point-in-time recovery is enabled or disabled for the table. | `bool` | `false` | no |
| <a name="encryption_type"></a> [encryption_type](#input\_encryption\_type) | The encryption option specified for the table. | `string` | `"AWS_OWNED_KMS_KEY"` | no |
| <a name="kms_key"></a> [kms_key](#input\_kms\_key) | The Amazon Resource Name (ARN) of the customer managed KMS key. | `string` |  | no |
| <a name="columns"></a> [columns](#columns) | List of Column Specification Maps | `list(map(string))` | `[]` | no |
| <a name="partition_key_columns"></a> [partition_key_columns](#input\_partition\_key\_columns) | List of the columns that are part of the partition key of the table. | `list(string)` | `[]` | no |
| <a name="clustering_key_columns"></a> [clustering_key_columns](#clustering\_key\_columns) | List of the column Specification that are part of the clustering key of the table. | `list(map(string))` | `[]` | no |
| <a name="static_key_columns"></a> [static_key_columns](#input\_static\_key\_columns) | List of the columns that have been defined as `STATIC`. | `list(string)` | `[]` | no |
| <a name="tags"></a> [tags](#input\_tags) | A map of tags to assign to the Table. | `map(string)` | `{}` | no |

#### columns

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="name"></a> [name](#input\_name) | The name of the column. | `string` |  | yes |
| <a name="type"></a> [type](#input\_type) | The data type of the column. | `string` |  | yes |

#### clustering_key_columns

| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="name"></a> [name](#input\_name) | The name of the clustering key column. | `string` |  | yes |
| <a name="order_by"></a> [order_by](#input\_order\_by) | The order modifier. Valid values: `ASC`, `DESC`. | `string` | `"ASC"` | no |

### Outputs

| Name | Type | Description |
|:------|:------|:------|
| <a name="keyspace_arn"></a> [keyspace_arn](#output\_keyspace\_arn) | The ARN of the Keyspace. | `string` | 
| <a name="keyspace_tables"></a> [keyspace_tables](#output\_keyspace_tables) | The ARN of the keyspace tables. | `map(string)` | 

### Authors

Module is maintained by [Ankit Jain](https://github.com/ankit-jn) with help from [these professional](https://github.com/ankit-jn/terraform-aws-keyspaces/graphs/contributors).