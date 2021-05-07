resource "google_cloud_run_service" "terraformed_cloudrun" {
  name     = "App 1"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/google-samples/hello-app:1.0" # Replace with your own
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  depends_on = [google_project_service.run_api]
}

# Enable the Cloud Run API
resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
}
