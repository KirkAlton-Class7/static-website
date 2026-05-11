# Static Website on GCS

[Link to the basic static website](https://storage.googleapis.com/kirkdevsecops-website/index.html)

---

This lab deploys a bucket in Google Cloud Storage and hosts a static HTML website.

## Source files:

* `index.html` (front facing page for the website)
* `404.html` (page shown when a website page is not found)
* `style.css` (stylesheet that controls the layout of all web pages)

---

# Resources

[CSS Basics (W3Schools)](https://www.w3schools.com/html/html_css.asp)

[Host a Static Website on Google Cloud Storage (HTTP)](https://cloud.google.com/storage/docs/hosting-static-website-http)

[Terraform - Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest)

[Terraform - GCS Backend Configuration](https://developer.hashicorp.com/terraform/language/settings/backends/gcs)

[Terraform - Google Cloud Storage Bucket Resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket)

[Cloud Storage - IAM Access Control](https://cloud.google.com/storage/docs/access-control/iam)

[Terraform - Google Cloud Storage Bucket IAM Resource](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam)

[Terraform for_each, toset(), and tomap()](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each)
