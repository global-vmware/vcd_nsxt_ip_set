variable "vdc_org_name" {}

variable "vdc_edge_name" {}

variable "vdc_group_name" {}

variable "ip_sets" {
  type = list(object({
    name            = string
    description     = string
    ip_addresses    = list(string)
  }))
}
