

resource "google_compute_global_address" "private_ips_for_pool" {
  name          = "cloud-build-private-ips"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.network.id
}


resource "google_service_networking_connection" "private_pool" {
  network                 = google_compute_network.network.id
  reserved_peering_ranges = [google_compute_global_address.private_ips_for_pool.name]
  service                 = "servicenetworking.googleapis.com"
}