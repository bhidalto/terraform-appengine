# ===== Variables for App Engine Service V1 ===== #
service_version_v1 = "default-v1"
runtime_v1         = "python27"
threadsafe_v1      = true
instance_class_v1  = "B1"
zip_v1 = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/helloworld-v1.zip"
  files_count = null
}
handlers_v1 = [{
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
instances_v1 = 2
# ===== /Variables for App Engine Service V1 ===== #


# ===== Variables for App Engine Service V2 ===== #
service_version_v2 = "default-v2"
runtime_v2         = "python27"
threadsafe_v2      = true
instance_class_v2  = "B1"
zip_v2 = {
  source_url  = "https://storage.googleapis.com/$MY_BUCKET/helloworld-v2.zip"
  files_count = null
}
handlers_v2 = [{
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
instances_v2 = 3
# ===== /Variables for App Engine Service V2 ===== #


# ===== Variables for Split Traffic ===== #
shard_by = "RANDOM"
allocations = {
  "default-v1" = 0.5
  "default-v2" = 0.5
}
migrate_traffic = false
# ===== /Variables for Split Traffic ===== #

# ===== Generic Variables ===== #
service = "default"