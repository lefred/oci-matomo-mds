output "matomo_public_ip" {
  value = module.matomo.public_ip
}

output "matomo_db_user" {
  value = var.matomo_name
}

output "matomo_db_password" {
  value = var.matomo_password
}

output "mds_instance_ip" {
  value =  module.mds-instance.private_ip
}

output "ssh_private_key" {
  value = local.private_key_to_show
  sensitive = true
}
