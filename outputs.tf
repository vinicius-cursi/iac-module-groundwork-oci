output "vcn_cidr" {
  value       = oci_core_vcn.vcn.cidr_blocks
  description = "Bloco de IPs da VCN"
}

output "pub_route_tables" {
  value       = oci_core_default_route_table.default_route_table
  description = "Rotas Publicas"
}

output "pub_route_rules" {
  value       = oci_core_default_route_table.default_route_table.route_rules
  description = "Regras Rotas Publicas"
}

output "priv_route_tables" {
  value       = oci_core_route_table.route_table
  description = "Rotas Privadas"
}

output "priv_route_rules" {
  value       = oci_core_route_table.route_table.route_rules
  description = "Regras Rotas Privadas"
}