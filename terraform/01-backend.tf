# ----------------------------------------------------------------
# Terraform Backend Configuration (GCS)
# ----------------------------------------------------------------

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "kirkdevsecops-terraform-state"
    prefix = "static-website/dev"
  }
}