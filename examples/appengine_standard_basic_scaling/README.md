# Deploying an App Engine Standard Service using Basic Scaling settings in a project by using terraform

This example covers a simple usage of the `Appengine Standard` module in order to deploy an App Engine Standard service that uses the Basic Scaling setting. Therefore the module used in the example looks like the following:

```
module "appengine_standard_basic_scaling" {
  source          = "../../modules/standard/basic_scaling/"
  service_version = var.service_version
  service         = var.service
  runtime         = var.runtime
  threadsafe      = var.threadsafe
  instance_class  = var.instance_class
  zip             = var.zip
  handlers        = var.handlers
  idle_timeout    = var.idle_timeout
  max_instances   = var.max_instances
}
```

There are more variables available to be used, all the information about the module can be found in the specific module's [documentation](../../modules/standard/basic_scaling).

## Usage

1. `terraform init -upgrade`
2. `terraform apply`

If you want to edit or change the variable's value, like the App Engine runtime to be used or the Basic Scaling settings, just edit the `terraform.tfvars` and modify the value of the variable itself.

Afterwards, if you have already initialized terraform, just run `terraform apply` and you will be ready to go!
