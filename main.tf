resource aws_keyspaces_keyspace "this" {
    count = var.create_keyspace ? 1 : 0

    name = var.keyspace_name
    tags = merge({"Name" = var.keyspace_name}, var.default_tags)
}

resource aws_keyspaces_table "this" {
    for_each = { for table in var.keyspace_tables: table.name => table }

    table_name    = each.key
    keyspace_name = var.keyspace_name

    comment {
        message = coalesce(try(each.value.comments, ""), each.key)
    }

    capacity_specification {
        throughput_mode      = try(each.value.thoughput_mode, "PAY_PER_REQUEST")
        read_capacity_units  = try(each.value.read_capacity_units, null)
        write_capacity_units = try(each.value.write_capacity_units, null)
    }
    
    encryption_specification {
        type = try(each.value.encryption_type, "AWS_OWNED_KMS_KEY")
        kms_key_identifier = try(each.value.encryption_type, "AWS_OWNED_KMS_KEY") == "CUSTOMER_MANAGED_KMS_KEY" ? each.value.kms_key : null
    }

    default_time_to_live = try(each.value.default_time_to_live, null)
    
    dynamic "ttl" {
        for_each = try(each.value.enable_ttl, false) ? [1] : []
        content {
            status = "ENABLED"
        }
    } 

    point_in_time_recovery {
        status = try(each.value.enable_point_in_time_recovery, false) ? "ENABLED" : "DISABLED"
    }

    dynamic "schema_definition" {
        for_each = try(length(each.value.columns), 0) > 0 ? [1] : []

        content {

            dynamic "column" {
                for_each = each.value.columns

                content {
                    name = lower(column.value.name)
                    type = column.value.type
                }
            }

            dynamic "partition_key" {
                for_each = each.value.partition_key_columns

                content {
                    name = lower(partition_key.value)
                }
            }

            dynamic "clustering_key" {
                for_each = each.value.clustering_key_columns

                content {
                    name = lower(clustering_key.value.name)
                    order_by = try(clustering_key.value.order_by, "ASC")
                }
            }

            dynamic "static_column" {
                for_each = each.value.static_columns

                content {
                    name = lower(static_column.value)
                }
            }
        }
    }

    tags = merge( { "Name" = each.key }, 
                    { "Keyspace" = var.keyspace_name }, 
                    try(each.value.tags, {}),
                    var.default_tags )   

    depends_on = [
        aws_keyspaces_keyspace.this
    ]
}