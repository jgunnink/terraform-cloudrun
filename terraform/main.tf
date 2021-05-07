resource "google_cloud_run_service" "terraformed_cloudrun" {
  name     = "hello-terraform"
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

# Allow unauthenticated users to invoke the service
resource "google_cloud_run_service_iam_member" "run_all_users" {
  service  = google_cloud_run_service.terraformed_cloudrun.name
  location = google_cloud_run_service.terraformed_cloudrun.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

# Enable the Cloud Run API
resource "google_project_service" "run_api" {
  service = "run.googleapis.com"
}
