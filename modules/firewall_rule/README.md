# Firewall rules module

This module is intended to easily create App Engine Firewall rules by using Terraform.

## Usage

```
module "firewall_rule" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/firewall_rule"
  priority     = 1000
  action       = "ALLOW"
  source_range = "*"
}
```

A detailed example on how to use it can be found [here](../examples/).

## Variables

Below is the list of available variables to be used upon creation of the Firewall rule.

| Variable | Description | Default value|
| --- | --- | -- |
| [source_range](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.firewall.ingressRules#FirewallRule.FIELDS.source_range) | (Required) IP address or range, defined using CIDR notation, of requests that this rule applies to. | -- |
| [action](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.firewall.ingressRules#action) | (Required) The action to take if this rule matches. Possible values are `UNSPECIFIED_ACTION`, `ALLOW`, and `DENY`. | -- |
| [description](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.firewall.ingressRules#FirewallRule.FIELDS.description) | (Optional) An optional string description of this rule. | -- |
| [priority](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.firewall.ingressRules#FirewallRule.FIELDS.priority) | (Optional) A positive integer that defines the order of rule evaluation. Rules with the lowest priority are evaluated first. A default rule at priority Int32.MaxValue matches all IPv4 and IPv6 traffic when no previous rule matches. Only the action of this rule can be modified by the user. | -- |


## Outputs

Once the Firewall rules have been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `apps/{{project}}/firewall/ingressRules/{{priority}}` |