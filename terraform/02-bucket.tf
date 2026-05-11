# ----------------------------------------------------------------
# Google Storage Bucket (GCS)
# ----------------------------------------------------------------

# GSC Bucket for Static Website
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "website_kirkdevsecops" {
  name          = "kirkdevsecops-website"
  location      = "US"
  force_destroy = true

  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://kirkdevsecops.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
}

# IAM Policy for Cloud Storage Bucket
# https://docs.cloud.google.com/storage/docs/access-control/iam
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam.html
resource "google_storage_bucket_iam_binding" "public_rule" {
  bucket = google_storage_bucket.website_kirkdevsecops.name
  role = "roles/storage.objectViewer"
  members = ["allUsers"]
}

# ----------------------------------------------------------------
# S3 Object Upload
# ----------------------------------------------------------------

# Terraform - for_each, toset(), and tomap()
# https://developer.hashicorp.com/terraform/language/meta-arguments/for_each

# Website Source Code (index.html, 404.html, style.css)
resource "google_storage_bucket_object" "site_src" {
  for_each = local.site_src

  name   = each.key
  source = "../site/${each.key}"
  content_type = each.value.content_type
  bucket = google_storage_bucket.website_kirkdevsecops.name
}

# Assets for Website - Beach Images
resource "google_storage_bucket_object" "beach_images" {
  for_each = toset(local.beach_images)

  name = "assets/images/beaches/${each.key}"
  source = "../site/assets/images/beaches/${each.key}"
  content_type = "img/png"
  bucket = google_storage_bucket.website_kirkdevsecops.name
  }