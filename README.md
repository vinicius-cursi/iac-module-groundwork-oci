<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_oci"></a> [oci](#requirement\_oci) | ~> 4.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_oci"></a> [oci](#provider\_oci) | 4.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [oci_core_default_route_table.default_route_table](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_default_route_table) | resource |
| [oci_core_internet_gateway.internet_gateway](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_internet_gateway) | resource |
| [oci_core_nat_gateway.nat_gateway](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_nat_gateway) | resource |
| [oci_core_route_table.route_table](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_route_table) | resource |
| [oci_core_service_gateway.service_gateway](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_service_gateway) | resource |
| [oci_core_vcn.vcn](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_vcn) | resource |
| [oci_identity_compartment.compartment](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/identity_compartment) | resource |
| [oci_core_services.services](https://registry.terraform.io/providers/hashicorp/oci/latest/docs/data-sources/core_services) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_compartment_description"></a> [compartment\_description](#input\_compartment\_description) | Descrição do compartment | `string` | n/a | yes |
| <a name="input_compartment_name"></a> [compartment\_name](#input\_compartment\_name) | Nome do compartment | `string` | n/a | yes |
| <a name="input_internet_gateway_display_name"></a> [internet\_gateway\_display\_name](#input\_internet\_gateway\_display\_name) | Nome do internet gateway | `string` | n/a | yes |
| <a name="input_nat_gateway_display_name"></a> [nat\_gateway\_display\_name](#input\_nat\_gateway\_display\_name) | Nome do NAT gateway | `string` | n/a | yes |
| <a name="input_priv_route_rules"></a> [priv\_route\_rules](#input\_priv\_route\_rules) | Lista de regras de rotas privadas | `any` | n/a | yes |
| <a name="input_pub_route_rules"></a> [pub\_route\_rules](#input\_pub\_route\_rules) | Lista de regras de rotas publicas | `any` | n/a | yes |
| <a name="input_root_compartment_id"></a> [root\_compartment\_id](#input\_root\_compartment\_id) | ID do compartment root | `string` | n/a | yes |
| <a name="input_service_gateway_display_name"></a> [service\_gateway\_display\_name](#input\_service\_gateway\_display\_name) | Nome do Service gateway | `string` | n/a | yes |
| <a name="input_vcn_cidr_blocks"></a> [vcn\_cidr\_blocks](#input\_vcn\_cidr\_blocks) | Lista com ranges de IP para esta VCN | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_vcn_display_name"></a> [vcn\_display\_name](#input\_vcn\_display\_name) | Nome da VCN | `string` | n/a | yes |
| <a name="input_vcn_dns_label"></a> [vcn\_dns\_label](#input\_vcn\_dns\_label) | Domínio raiz do VCN | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_priv_route_rules"></a> [priv\_route\_rules](#output\_priv\_route\_rules) | Regras Rotas Privadas |
| <a name="output_priv_route_tables"></a> [priv\_route\_tables](#output\_priv\_route\_tables) | Rotas Privadas |
| <a name="output_pub_route_rules"></a> [pub\_route\_rules](#output\_pub\_route\_rules) | Regras Rotas Publicas |
| <a name="output_pub_route_tables"></a> [pub\_route\_tables](#output\_pub\_route\_tables) | Rotas Publicas |
| <a name="output_vcn_cidr"></a> [vcn\_cidr](#output\_vcn\_cidr) | Bloco de IPs da VCN |
<!-- END_TF_DOCS -->