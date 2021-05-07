output "cloud_run_service_url" {
  description = "The URL for where the deployed service can be accessed."
  value       = google_cloud_run_service.terraformed_cloudrun.status[0].url
}
