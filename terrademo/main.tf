terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.6.0"
    }
  }
}

provider "google" {
  project = "ny-rides-aswin"
  region  = "europe-west1-b"
}

resource "google_storage_bucket" "demo-bucket" {
  name          = "ny-rides-aswin-terra-bucket-916"
  location      = "EU"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}