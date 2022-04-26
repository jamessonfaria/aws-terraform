output "extensions" {
    value = local.file_extensions
}

output "extensions_upper" {
    value = local.file_extensions_upper
}

output "instance_arns" {
    value = [for k, v in aws_instance.this : v.arn]
}

output "instances_names" {
    value = {for k, v in aws_instance.this : k => v.tags.Name}
}