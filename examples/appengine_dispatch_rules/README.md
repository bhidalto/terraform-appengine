# Adding Dispatch Rules in App Engine using terraform

This example covers a simple usage of the `Dispatch Rules` module in order create rules to match an HTTP request and dispatch that request to a service.Therefore the module used in the example looks like the following:

```
module "appengine_dispatch_rules" {
  source     = "../../modules/url_dispatch_rules"
  domain     = var.domain
  path       = var.path
  service    = var.service
}
```

There are more variables available to be used, all the information about the module can be found in the specific module's [documentation](../../modules/url_dispatch_rules).

## Usage

1. `terraform init -upgrade`
2. `terraform apply`

If you want to edit or change the variable's value, like the App Engine's service, just edit the `terraform.tfvars` and modify the value of the variable itself.

Afterwards, if you have already initialized terraform, just run `terraform apply` and you will be ready to go!
