terraform {
  required_version = ">= 0.15.3"

  backend "gcs" {
    # Pass in the bucket via cli arg. Eg: terraform init -backend-config=dev.tfbackend
  }

  required_providers {
    google = ">= 3.66.1"
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}
