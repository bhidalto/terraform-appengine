# Splitting traffic in App Engine service's versions using terraform

This example covers a simple usage of the `Split Traffic` module in order to be able to split the traffic between versions from an App Engine service. Therefore the module used in the example looks like the following:

```
module "appengine_service_split_traffic" {
  source          = "../../modules/split_traffic"
  service         = var.service
  shard_by        = var.shard_by
  allocations     = var.allocations
  migrate_traffic = var.migrate_traffic
}
```
Along this module, two sample versions of the default service will be deployed to serve as an example. Further details of the Standard Module can be found in the module's specific [reference](../../modules/standard/manual_scaling) and an example demonstrating the usage of the module can be found [here](../appengine_standard_manual_scaling).

There are more variables available to be used, all the information about the module can be found in the specific module's [documentation](../../modules/split_traffic).

## Usage

1. `terraform init -upgrade`
2. `terraform apply`

If you want to edit or change the variable's value, like the App Engine's version name or the logic to split traffic, just edit the `terraform.tfvars` and modify the value of the variable itself.

Afterwards, if you have already initialized terraform, just run `terraform apply` and you will be ready to go!
