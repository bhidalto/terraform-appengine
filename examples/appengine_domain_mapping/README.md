# Mapping Custom Domains in App Engine using terraform

This example covers a simple usage of the `Domain Mapping` module in order to initialize App Engine in a project. Therefore the module used in the example looks like the following:

```
module "appengine_domain_mapping" {
  source       = "../../modules/domain_mapping"
  domain_name  = var.domain_name
  ssl_settings = var.ssl_settings
}
```

There are more variables available to be used, all the information about the module can be found in the specific module's [documentation](../../modules/domain_mapping).

## Usage

1. `terraform init -upgrade`
2. `terraform apply`

If you want to edit or change the variable's value, like the Domain name or the SSL settings to apply, just edit the `terraform.tfvars` and modify the value of the variable itself.

Afterwards, if you have already initialized terraform, just run `terraform apply` and you will be ready to go!
