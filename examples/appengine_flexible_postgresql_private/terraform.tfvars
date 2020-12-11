### Variables definition for VPC network
vpc_network_name                    = "private-csql-vpc-postgres"
routing_mode                        = "GLOBAL"
vpc_auto_create_subnetworks_enabled = true

### Variables definition for IP address allocation range
allocated_ip_address_range_name = "private-ip-allocation-postgres"
prefix_length                   = 16

### Variables definition for Cloud SQL instance
instance_name    = "private-postgres-instance"
sql_region       = "europe-west1"
postgres_version = "POSTGRES_10"

## Variables definition for Cloud SQL user
sql_user_name = "cloud-sql-postgres-user"

## Variables declaration for Cloud SQL Database
database_name = "terraform-db"

# Variables for Standard Module
service_version = "py1234"
service         = "terraform-py37"
runtime         = "python"
network = {
  forwarded_ports  = null
  instance_tag     = null
  name             = "private-csql-vpc-postgres"
  subnetwork       = "private-csql-vpc-postgres"
  session_affinity = null
}
# Variables for Zip Module
zip = {
  source_url  = "https://storage.googleapis.com/elated-badge-296516.appspot.com/gae_flex_sql.zip"
  files_count = null
}

# Variables for Entrypoint block
entrypoint = {
  shell = "gunicorn -b :$PORT main:app"
}

# Variables for Manual Scaling module
instances = 1
