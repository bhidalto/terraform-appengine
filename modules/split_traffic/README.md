# Split traffic module

This module is intended to easily split traffic between App  using Terraform.

## Usage

```
module "split_traffic" {
  source = "git::https://github.com/bhidalto/terraform-appengine/modules/split_traffic"
  service = "my-gae-service"
  migrate_traffic = false
  split {
    shard_by = "IP"
    allocations = {
      (gae-service.version1_id) = 0.75
      (gae-service.version2_id) = 0.25
    }
  }
}
```

A detailed example on how to use it can be found [here](../examples/).

## Variables

Below is the list of available variables to be used upon creation of the Split traffic module.

| Variable | Description | Default value|
| --- | --- | -- |
| service | (Required) The name of the service these settings apply to. | -- |
| [shard_by](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services#shardby) | (Optional) Mechanism used to determine which version a request is sent to. The traffic selection algorithm will be stable for either type until allocations are changed. Possible values are UNSPECIFIED, COOKIE, IP, and RANDOM. | -- |
| [allocations](https://cloud.google.com/appengine/docs/admin-api/reference/rest/v1/apps.services#TrafficSplit.FIELDS.allocations) | (Required) Mapping from version IDs within the service to fractional (0.000, 1] allocations of traffic for that version. Each version can be specified only once, but some versions in the service may not have any traffic allocation. Services that have traffic allocated cannot be deleted until either the service is deleted or their traffic allocation is removed. Allocations must sum to 1. Up to two decimal place precision is supported for IP-based splits and up to three decimal places is supported for cookie-based splits.| -- |
| migrate_traffic | (Optional) If set to true traffic will be migrated to this version. | -- |


## Outputs

Once the Split traffic module has been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the resource with format `apps/{{project}}/services/{{service}}` |
