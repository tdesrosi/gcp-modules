
/******************************************
  Cloud Router
 *****************************************/

# Enabling CLoud Build Worker Pool for Peering
resource "google_compute_global_address" "cloud_build_worker_range" {
  project       = var.project_id
  name          = var.work_pool_address_name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.network_id
}

resource "google_service_networking_connection" "cloud_build_worker_pool_connection" {
  network                 = var.network_id
  reserved_peering_ranges = [google_compute_global_address.cloud_build_worker_range.name]
  service                 = "servicenetworking.googleapis.com"
}

resource "google_cloudbuild_worker_pool" "cloud_build_worker_pool" {
  project   = var.project_id
  location  = var.region
  name      = var.worker_pool_name

  worker_config {
    disk_size_gb = 100
    machine_type = "e2-standard-4"
    no_external_ip = true
  }

  network_config {
    peered_network = var.network_id
  }

}