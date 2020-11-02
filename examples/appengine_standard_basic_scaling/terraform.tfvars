# Variables for Standard Module
runtime        = "python27"
service        = "terraform-py27"
instance_class = "B1"

# Variables for Zip Module
zip = {
  source_url  = "source.zip"
  files_count = null
}

# Variables for Basic Scaling module
idle_timeout  = "30s"
max_instances = 5
