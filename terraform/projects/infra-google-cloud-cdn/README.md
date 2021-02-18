## Project: infra-google-cloud-cdn

This project creates the Google Cloud CDN which fronts the Google Cloud Storage  
bucket which contains mirrored GOV.UK static pages

## Requirements

| Name | Version |
|------|---------|
| terraform | = 0.13.6 |
| gcp | ~> 3.57.0 |
| random | 3.0.1 |

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| random | 3.0.1 |
| terraform | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [google_compute_backend_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_bucket) |
| [google_compute_backend_bucket_signed_url_key](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_bucket_signed_url_key) |
| [google_compute_global_address](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) |
| [google_compute_global_forwarding_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) |
| [google_compute_managed_ssl_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_managed_ssl_certificate) |
| [google_compute_target_https_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_https_proxy) |
| [google_compute_url_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) |
| [google_storage_bucket_iam_binding](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_binding) |
| [random_id](https://registry.terraform.io/providers/hashicorp/random/3.0.1/docs/resources/id) |
| [terraform_remote_state](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| google\_environment | Google environment, which is govuk environment. e.g: staging | `string` | `""` | no |
| google\_project\_id | Google project ID | `string` | `"eu-west2"` | no |
| google\_project\_no | Google project no | `number` | n/a | yes |
| google\_region | Google region the provider | `string` | `"eu-west2"` | no |
| remote\_state\_bucket | GCS bucket we store our terraform state in | `string` | n/a | yes |
| remote\_state\_infra\_google\_mirror\_bucket\_prefix | GCS bucket prefix where the infra-google-mirror-bucket state files are stored | `string` | n/a | yes |

## Outputs

No output.
