provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

module "groundwork" {
  source                        = "../"
  root_compartment_id           = var.root_compartment_id
  compartment_name              = local.name
  compartment_description       = "Compartment para guardar os recursos relativos a ${local.name}"
  vcn_display_name              = "vcn-${local.name}"
  internet_gateway_display_name = "igw-${local.name}"
  nat_gateway_display_name      = "nat-${local.name}"
  service_gateway_display_name  = "sgw-${local.name}"
  priv_route_rules              = local.groundwork.priv_route_rules
  pub_route_rules               = local.groundwork.pub_route_rules
  vcn_dns_label                 = local.name

  # subnet_display_name           = "${local.name}-subnet"
  # subnet_dns_label = local.name
}

output "vcn_cidr" {
  value = module.groundwork.vcn_cidr
}

output "pub_route_tables" {
    value = module.groundwork.pub_route_tables
}

output "priv_route_tables" {
    value = module.groundwork.priv_route_tables
}