resource "oci_identity_compartment" "compartment" {
  #Required
  compartment_id = var.root_compartment_id
  description    = var.compartment_description
  name           = var.compartment_name

  #Optional
  #defined_tags = {"Operations.CostCenter"= "42"}
  #freeform_tags = {"Department"= "Finance"}
}

resource "oci_core_vcn" "vcn" {
  #Required
  compartment_id = oci_identity_compartment.compartment.id

  #Optional
  cidr_blocks  = var.vcn_cidr_blocks
  display_name = var.vcn_display_name
  dns_label    = var.vcn_dns_label

  #defined_tags = {"Operations.CostCenter"= "42"}
  #freeform_tags = {"Department"= "Finance"}

}

resource "oci_core_internet_gateway" "internet_gateway" {
  #Required
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  display_name = var.internet_gateway_display_name
  #freeform_tags = {"Department"= "Finance"}
  #defined_tags = {"Operations.CostCenter"= "42"}

}

resource "oci_core_nat_gateway" "nat_gateway" {
  #Required
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_vcn.vcn.id

  #Optional
  display_name = var.nat_gateway_display_name
  #freeform_tags = {"Department"= "Finance"}
  #defined_tags = {"Operations.CostCenter"= "42"}
}

resource "oci_core_service_gateway" "service_gateway" {
  #Required
  compartment_id = oci_identity_compartment.compartment.id
  services {
    #Required
    service_id = data.oci_core_services.services.services.0.id
  }
  vcn_id = oci_core_vcn.vcn.id

  #Optional
  # defined_tags   = { "Operations.CostCenter" = "42" }
  display_name = var.service_gateway_display_name
  # freeform_tags  = { "Department" = "Finance" }
  # route_table_id = oci_core_route_table.route_table.id
}

resource "oci_core_route_table" "route_table" {
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = "priv-routetable-01"
  vcn_id         = oci_core_vcn.vcn.id

  route_rules {
    description       = "Trafego de/para a Internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_nat_gateway.nat_gateway.id
  }

  route_rules {
    destination       = "all-iad-services-in-oracle-services-network"
    destination_type  = "SERVICE_CIDR_BLOCK"
    network_entity_id = oci_core_service_gateway.service_gateway.id // "ocid1.servicegateway.oc1.iad.aaaaaaaa5wm3pm2arkrr5hllg4vumc56eu3yyvp5ez2nmaawpf2thifsdnga"
  }

  dynamic "route_rules" {
    for_each = var.priv_route_rules
    content {
      description       = lookup(route_rules.value, "description", "")
      destination       = lookup(route_rules.value, "destination", "")
      destination_type  = lookup(route_rules.value, "destination_type", "CIDR_BLOCK")
      network_entity_id = oci_core_nat_gateway.nat_gateway.id
    }
  }
}

resource "oci_core_default_route_table" "default_route_table" {
  display_name               = "pub-routetable-01"
  manage_default_resource_id = oci_core_vcn.vcn.default_route_table_id
  route_rules {
    description       = "Tráfedo de/para Internet"
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.internet_gateway.id
  }

  dynamic "route_rules" {
    for_each = var.pub_route_rules
    content {
      description       = lookup(route_rules.value, "description", "")
      destination       = lookup(route_rules.value, "destination", "")
      destination_type  = lookup(route_rules.value, "destination_type", "CIDR_BLOCK")
      network_entity_id = oci_core_nat_gateway.nat_gateway.id
    }
  }
}

