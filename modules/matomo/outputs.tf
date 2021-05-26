output "id" {
  value = oci_core_instance.Matomo.*.id
}

output "public_ip" {
  value = join(", ", oci_core_instance.Matomo.*.public_ip)
}

output "matomo_user_name" {
  value = var.matomo_name
}

output "matomo_schema_name" {
  value = var.matomo_schema
}

output "matomo_host_name" {
  value = oci_core_instance.Matomo.*.display_name
}
