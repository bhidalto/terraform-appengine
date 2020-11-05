### Variables definition for VPC network
vpc_network_name = "private-csql-vpc-for-postgres"
routing_mode     = "GLOBAL"

### Variables definition for IP address allocation range
allocated_ip_address_range_name = "private-ip-allocation-for-postgres"
prefix_length                   = 16

### Variables definition for Cloud SQL instance
instance_name    = "private-postgres-instance"
sql_region       = "europe-west1"
postgres_version = "MYSQL_5_7"

## Variables definition for Cloud SQL user
sql_user_name = "cloud-sql-postgres-user"

# Variables for SVPC connector
svpc_connector_name           = "postgres-svpc-euw"
ip_cidr_range  = "10.0.8.0/28"
region         = "europe-west1"
min_throughput = 200
max_throughput = 300

# Variables for Standard Module
service_version = "py1234"
service         = "terraform-py27"
runtime         = "python27"
threadsafe      = true
instance_class  = "F1"

# Variables for Zip Module
zip = {
  source_url  = "https://storage.googleapis.com/javafileswave23/gae-postgres-py27.zip"
  files_count = null
}

# Variables for Handlers block
handlers = [{
  url_regex                   = "/.*",
  security_level              = null,
  login                       = null,
  auth_fail_action            = null,
  redirect_http_response_code = null,
  script = {
    script_path = "main.app"
  }
  static_files = null
}]

# Variables for Automatic Scaling module
automatic_scaling = {
  max_concurrent_requests = 10,
  max_idle_instances      = 10,
  max_pending_latency     = "1s",
  min_idle_instances      = 3,
  min_pending_latency     = "0.01s",
  standard_scheduler_settings = {
    target_cpu_utilization        = 0.6,
    target_throughput_utilization = 0.6,
    min_instances                 = 0,
    max_instances                 = 1
  }
}
