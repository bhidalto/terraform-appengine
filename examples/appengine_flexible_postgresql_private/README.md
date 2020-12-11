# Connecting App Engine to a Private Cloud SQL PostgreSQL instance

This example demonstrates how to create and connect an [App Engine Standard](https://cloud.google.com/appengine/docs/standard) app to a [Cloud SQL PostgreSQL instance](https://cloud.google.com/sql/docs/postgres) configured for [private IP address](https://cloud.google.com/sql/docs/postgres/configure-private-ip) access.

It also creates a new [Cloud SQL user](https://cloud.google.com/sql/docs/postgres/create-manage-users) since **Terraform deletes the default user** upon creation for security reasons, as described [here.](https://www.terraform.io/docs/providers/google/r/sql_database_instance.html)

A [Cloud SQL database](https://cloud.google.com/sql/docs/postgres/create-manage-databases) will also be created in the process, so the App Engine application will be able to interact with it. Postgres instances, only contain the ***postgres*** default database, hence why we will be creating a new one.

Last but not least, we will also be creating a [Serverless VPC access connector](https://cloud.google.com/vpc/docs/configure-serverless-vpc-access) in the process, in order to be able to communicate our App Engine application with the Cloud SQL PostgreSQL instance by using its private IP.

***Note: for Cloud SQL PostgreSQL users, the password may not be empty, or else it will error out when creating it.***

## Usage

1. `terraform init -upgrade`
2. *(Optional)* `terraform plan` -- will print all the resources that will be created in the process
3. `terraform apply`

If you want to edit or change any variable, such as the Cloud SQL PostgreSQL instance name or the App Engine service, just edit the `terraform.tfvars` and modify the variable itself.

Afterwards, if you have already initialized terraform, just run `terraform apply` and you will be ready to go!

For more information about all the available variables for each of the resources, refer to each of the resources documentation:

- [Cloud SQL PostgreSQL instance](https://github.com/crodriguezconde/terraform-google-cloud-sql/tree/master/modules/cloud_sql_postgres)

- [Cloud SQL User](https://github.com/crodriguezconde/terraform-google-cloud-sql/tree/master/modules/cloud_sql_user)

- [Cloud SQL Database](https://github.com/crodriguezconde/terraform-google-cloud-sql/tree/master/modules/cloud_sql_database)

- [VPC network](https://github.com/crodriguezconde/terraform-google-cloud-sql/tree/master/modules/vpc_network)

- [Allocated IP address range](https://github.com/crodriguezconde/terraform-google-cloud-sql/tree/master/modules/allocated_ip_address_range)

- [Private connection](https://github.com/crodriguezconde/terraform-google-cloud-sql/tree/master/modules/private_connection)

- [App Engine Standard (automatic scaling)](https://github.com/bhidalto/terraform-appengine/tree/main/modules/standard/automatic_scaling)

- [Serverless VPC access connector](https://github.com/bhidalto/terraform-serverless-vpc-connector)

## Dependencies

In order to successfully create and deploy the whole setup, the following modules will be installed upon running `terraform init -upgrade`:

### Cloud SQL PostgreSQL dependencies

- `terraform-google-cloud-sql.git//modules/cloud_sql_postgres` responsible of creating the actual Cloud SQL PostgreSQL instance. 
- `terraform-google-cloud-sql.git//modules/cloud_sql_user` responsible of creating a new Cloud SQL user upon instance's creation in order to be able to connect to the Cloud SQL PostgreSQL instance.
- `terraform-google-cloud-sql.git//modules/vpc_network`responsible of creating a VPC network that will allocate the Cloud SQL PostgreSQL instance's private IP address.
- `terraform-google-cloud-sql.git//modules/allocated_ip_address_range` responsible of allocating an IP address range in order to be used later by the Cloud SQL PostgreSQL instance.
- `terraform-google-cloud-sql.git//modules/private_connection` responsible of creating a VPC peering between your project and the service project, so we can later use Private IP with our Cloud SQL instance. 
- `terraform-google-cloud-sql.git//modules/cloud_sql_database` responsible of creating the PostgreSQL database that our app will be utilizing.

### App Engine Standard dependencies

- `terraform-appengine.git//modules/standard/automatic_scaling` responsible of creating App Engine's service. In this example the automatic_scaling options will be utilized.

### Serverless VPC access connector dependencies

- `terraform-serverless-vpc-connector.git//modules/serverless_vpc_connector` responsible of creating the Serverless VPC access connector for App Engine. Will be used by the application in order to be able to connect to the Cloud SQL PostgreSQL instance by using its private IP.




