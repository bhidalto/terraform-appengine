# Initializing App Engine in a project using terraform

This example covers a simple usage of the `App` module in order to initialize App Engine in a project. Therefore the module used in the example looks like the following:

```
module "appengine_app" {
  source        = "../../modules/app"
  project       = var.project
  location_id   = var.location_id
  database_type = var.database_type
}
```

There are more variables available to be used, all the information about the module can be found in the specific module's [documentation](../../modules/app).

## Usage

1. `terraform init -upgrade`
2. `terraform apply`

If you want to edit or change the variable's value, like the App Engine region or the backend Database to use, just edit the `terraform.tfvars` and modify the value of the variable itself.

Afterwards, if you have already initialized terraform, just run `terraform apply` and you will be ready to go!
