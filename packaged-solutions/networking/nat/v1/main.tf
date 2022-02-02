
/******************************************
  Cloud Router
 *****************************************/

resource "google_compute_router" "cloud_nat_router_region" {
  name    = "${var.network_name}-${var.region}-nat-router"
  project = var.project_id
  region  = var.region
  network = var.network_self_link
  bgp {
    asn = var.cloud_router_asn_number
  }
}

/******************************************
  Cloud NAT
 *****************************************/

resource "google_compute_router_nat" "cloud_nat_region" {
  name                               = "${var.network_name}-${var.region}-nat"
  project                            = var.project_id
  router                             = google_compute_router.cloud_nat_router_region.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ALL"
  }
}