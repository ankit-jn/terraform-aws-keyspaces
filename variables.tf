variable "create_keyspace" {
    description = "Flag to decide if Keyspace should be provisioned."
    type        = bool
    default     = true
}

variable "keyspace_name" {
    description = "The name of the keyspace to be created."
    type        = string
    default     = null
}

variable "keyspace_tables" {
    description = <<EOF
The List of Map for Keyspace tables configurations

name: (Required) The name of the Keyspace table.
comments: (Optional) A description of the table.

thoughput_mode: (Optional) The read/write throughput capacity mode for a table.
read_capacity_units: (Optional) The throughput capacity specified for read operations defined in read capacity units (RCUs).
write_capacity_units: (Optional) The throughput capacity specified for write operations defined in write capacity units (WCUs).

default_time_to_live: (Optional) The default Time to Live setting in seconds for the table.
enable_ttl: (Optional) Flag to decide if enable TTL custom setting on the table.

enable_point_in_time_recovery: (Optional) Flag to decide if point-in-time recovery is enabled or disabled for the table.

encryption_type: (Optional) The encryption option specified for the table.
kms_key: (Optional) The Amazon Resource Name (ARN) of the customer managed KMS key.

columns: (Optional) List of Column Specification Maps with following key/value pairs:
    name: (Required) The name of the column.
    type: (Required) The data type of the column.

partition_key_columns: (Optional) List of the columns that are part of the partition key of the table.
clustering_key_columns: (Optional) List of the column Specification that are part of the clustering key of the table.
    name: (Required) The name of the clustering key column.
    order_by: (Optional) The order modifier. Valid values: `ASC`, `DESC`.
static_columns: (Optional) List of the columns that have been defined as `STATIC`.

tags: (Optional) A map of tags to assign to the Table.
EOF
    type    = any
    default = []
}

variable "default_tags" {
    description = "A map of tags to assign to all the resources."
    type        = map(string)
    default     = {}
}