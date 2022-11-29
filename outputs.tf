output "keyspace_arn" {
    description = "The ARN of the keyspace."
    value = var.create_keyspace ? aws_keyspaces_keyspace.this[0].arn : ""
}

output "keyspace_tables" {
    description = "The ARN of the Keyspace tables."
    value       = { for key, table in aws_keyspaces_table.this: key => table.arn }
}