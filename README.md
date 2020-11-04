# Google App Engine module

This module is intended to be used to easily initialize App Engine and create Standard or Flexible applications.

## Overview

App Engine is a fully managed, serverless platform for developing and hosting web applications at scale. You can choose from several popular languages, libraries, and frameworks to develop your apps, then let App Engine take care of provisioning servers and scaling your app instances based on demand.

### Standard Environment

The [App Engine standard environment](https://cloud.google.com/appengine/docs/standard) is based on container instances running on Google's infrastructure. Containers are preconfigured with one of several available runtimes.

The App Engine standard environment makes it easy to build and deploy an application that runs reliably even under heavy load and with large amounts of data.

Applications run in a secure, sandboxed environment, allowing the App Engine standard environment to distribute requests across multiple servers, and scaling servers to meet traffic demands. Your application runs within its own secure, reliable environment that is independent of the hardware, operating system, or physical location of the server.

### Flexible Environment

App Engine allows developers to focus on what they do best: writing code. Based on Google Compute Engine, the [App Engine flexible environment](https://cloud.google.com/appengine/docs/flexible) automatically scales your app up and down while also balancing the load.

#### Features
- Customizable infrastructure - App Engine flexible environment instances are Compute Engine virtual machines, which means that you can take advantage of custom libraries, use SSH for debugging, and deploy your own Docker containers.

- Performance options - Take advantage of a wide array of CPU and memory configurations. You can specify how much CPU and memory each instance of your application needs, and the flexible environment will provision the necessary infrastructure for you.

- Native feature support - Features such as microservices, authorization, SQL and NoSQL databases, traffic splitting, logging, versioning, security scanning, and content delivery networks are natively supported.

- Managed virtual machines - App Engine manages your virtual machines, ensuring that:

  - Instances are health-checked, healed as necessary, and co-located with other services within the project.
  - Critical, backwards compatible updates are automatically applied to the underlying operating system.
  - VM instances are automatically located by geographical region according to the settings in your project. Google's management services ensure that all of a project's VM instances are co-located for optimal performance.
  - VM instances are restarted on a weekly basis. During restarts Google's management services will apply any necessary operating system and security updates.
  - You always have root access to Compute Engine VM instances. SSH access to VM instances in the flexible environment is disabled by default. If you choose, you can enable root access to your app's VM instances.

## Before you begin

- If you do not have a Google Cloud Platform project, create a new GCP project in the [Google Cloud Console](https://console.cloud.google.com) and set up billing on that project.

- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) if you do not have it installed, as it will be needed in order to play with the modules.

## Authentication

There are two main ways to authenticate when using Terraform with the Google provider:

1. The easiest way is to authenticate using the gcloud command as follows:

```
gcloud auth application-default login
```

[Here](https://cloud.google.com/sdk/gcloud/reference/auth/application-default) you will find further information on the command specified above.

If you do not have it installed, gcloud can be installed following this [tutorial](https://cloud.google.com/sdk/docs/install).

2. For a production use-case, you will want to use service account authentication, in other words, a [service account](https://cloud.google.com/docs/authentication/getting-started).

From the service account key page in the [Cloud Console](https://console.cloud.google.com/apis/credentials/serviceaccountkey) choose an existing account, or create a new one.

Download the JSON key file. Name it something you can remember, and **store it somewhere secure on your machine.**

You supply the key to Terraform using the environment variable GOOGLE_APPLICATION_CREDENTIALS, setting the value to the location of the file, as follows:

```
export GOOGLE_APPLICATION_CREDENTIALS={{path}}
```

## Usage

1. Clone the GitHub repository by running the following command on your terminal:

```
$ git clone https://github.com/bhidalto/terraform-appengine.git
```

2. Change directory to the examples folder to run any of the provided examples.

```
$ cd terraform-appengine/modules/examples/
```

3. Run `terraform init` to download the different modules as well as the Google provider.

4. (Optional) Run `terraform plan` to see the different resources that will be created.

5. Run `terraform apply` to create the infrastructure within your Google Cloud Platform project.

6. Run `terraform destroy` to undeploy the resources created.