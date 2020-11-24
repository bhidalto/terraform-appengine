# Creating App Engine's Firewall Rules

This example covers a simple usage of the `Firewall Rule` module in order to set up App Engine Firewall rules. Therefore the module used in the example looks like the following:

```
module "appengine_firewall_rule" {
  source       = "../../modules/firewall_rule"
  source_range = var.source_range
  action       = var.action
  description  = var.description
  priority     = var.priority
}
```

For a detailed view of the module and all its specifications, refer to the specific module's [documentation](../../modules/firewall_rule).

## Usage

1. `terraform init -upgrade`
2. `terraform apply`

If you want to edit or change the variable's value, like the Firewall's source range or the priority of the rule, just edit the `terraform.tfvars` and modify the value of the variable itself.

Afterwards, if you have already initialized terraform, just run `terraform apply` and you will be ready to go!
