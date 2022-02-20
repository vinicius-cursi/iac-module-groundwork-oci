variable "root_compartment_id" {
  type        = string
  description = "ID do compartment root"
  sensitive   = true
}

variable "compartment_name" {
  type        = string
  description = "Nome do compartment"
}

variable "compartment_description" {
  type        = string
  description = "Descrição do compartment"
}

variable "vcn_cidr_blocks" {
  type        = list(string)
  description = "Lista com ranges de IP para esta VCN"
  default     = ["10.0.0.0/16"]
}

variable "vcn_display_name" {
  type        = string
  description = "Nome da VCN"
}

variable "vcn_dns_label" {
  type        = string
  description = "Domínio raiz do VCN"
}

variable "priv_route_rules" {
  type        = any
  description = "Lista de regras de rotas privadas"
}

variable "pub_route_rules" {
  type        = any
  description = "Lista de regras de rotas publicas"
}

variable "internet_gateway_display_name" {
  type        = string
  description = "Nome do internet gateway"
}

variable "nat_gateway_display_name" {
  type        = string
  description = "Nome do NAT gateway"
}

variable "service_gateway_display_name" {
  type        = string
  description = "Nome do Service gateway"
}


