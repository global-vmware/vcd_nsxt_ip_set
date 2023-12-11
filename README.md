# VCD NSX-T IP Set Terraform Module

This Terraform module will deploy NSX-T IP Sets into an existing VMware Cloud Director (VCD) Environment.  This module can be used to provision new IP Sets into [Rackspace Technology SDDC Flex](https://www.rackspace.com/cloud/private/software-defined-data-center-flex) VCD Data Center Regions.

## Requirements

| Name      | Version |
|-----------|---------|
| terraform | ~> 1.2  |
| vcd       | ~> 3.8  |

## Resources

| Name                                                                 | Type         |
|----------------------------------------------------------------------|--------------|
| [vcd_vdc_group](https://registry.terraform.io/providers/vmware/vcd/3.8.2/docs/data-sources/vdc_group) | data source |
| [vcd_nsxt_edgegateway](https://registry.terraform.io/providers/vmware/vcd/3.8.2/docs/data-sources/nsxt_edgegateway) | data source |
| [vcd_nsxt_ip_set](https://registry.terraform.io/providers/vmware/vcd/3.8.2/docs/resources/nsxt_ip_set) | resource |

## Inputs

| Name            | Description                                                      | Type | Default | Required |
|-----------------|------------------------------------------------------------------|------|---------|----------|
| vdc_org_name | The name of the Data Center Group Organization in VCD | string | `"Organization Name Format: <Account_Number>-<Region>-<Account_Name>"` | yes |
| vdc_group_name | The name of the Data Center Group in VCD | string | `"Data Center Group Name Format: <Account_Number>-<Region>-<Account_Name> <datacenter group>"` | yes |
| vdc_edge_name | The name of the NSX-T Edge Gateway in VCD | string | `"Edge Gateway Name Format: <Account_Number>-<Region>-<Edge_GW_Identifier>-<edge>"` | yes |
| ip_sets | A list of IP sets to create in NSX-T | list | N/A | yes |

## Outputs

| Name             | Description                              |
|------------------|------------------------------------------|
| ip_set_names     | The names of the NSX-T IP sets that were created |
| ip_set_ids       | The IDs of the NSX-T IP sets that were created |

## Example Usage

This is an example of a `main.tf` file that uses the `"github.com/global-vmware/vcd_nsxt_ip_set"` Module source to create NSX-T IP Sets in a VMware Cloud Director environment:

```terraform
module "vcd_nsxt_ip_set" {
  source            = "github.com/global-vmware/vcd_nsxt_ip_set.git?ref=v1.2.1"

  vdc_org_name      = "<US1-VDC-ORG-NAME>"
  vdc_group_name    = "<US1-VDC-GRP-NAME>"
  vdc_edge_name     = "<US1-VDC-EDGE-NAME>"

  ip_sets = [
    {
      name         = "US1-Segment-01-Network_192.168.0.0/24_IP-Set"
      description  = "US1-Segment-01 Network IP Set"
      ip_addresses = ["172.16.0.0/24"]
    },
    {
      name         = "US1-Segment-02-Network_192.168.1.0/24_IP-Set"
      description  = "US1-Segment-02 Network IP Set"
      ip_addresses = ["172.16.1.0/24"]
    }
  ]
}
```

## Authors

This module is maintained by the [Global VMware Cloud Automation Services Team](https://github.com/global-vmware).