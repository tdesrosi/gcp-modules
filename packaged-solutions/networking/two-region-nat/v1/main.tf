
/******************************************
  Cloud Router Region 1
 *****************************************/

resource "google_compute_router" "cloud_nat_router_region_1" {
  name    = "${var.network_name}-${var.region_1}-nat-router"
  project = var.project_id
  region  = var.region_1
  network = var.network_self_link
  bgp {
    asn = var.cloud_router_asn_number_region_1
  }
}

/******************************************
  Cloud NAT Region 1
 *****************************************/

resource "google_compute_router_nat" "cloud_nat_region_1" {
  name                               = "${var.network_name}-${var.region_1}-nat"
  project                            = var.project_id
  router                             = google_compute_router.cloud_nat_router_region_1.name
  region                             = var.region_1
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ALL"
  }
}

/******************************************
  Cloud Router Region 2
 *****************************************/

resource "google_compute_router" "cloud_nat_router_region_2" {
  name    = "${var.network_name}-${var.region_2}-nat-router"
  project = var.project_id
  region  = var.region_2
  network = var.network_self_link
  bgp {
    asn = var.cloud_router_asn_number_region_2
  }
}

/******************************************
  Cloud NAT Region 2
 *****************************************/

resource "google_compute_router_nat" "cloud_nat_region_2" {
  name                               = "${var.network_name}-${var.region_1}-nat"
  project                            = var.project_id
  router                             = google_compute_router.cloud_nat_router_region_2.name
  region                             = var.region_2
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    enable = true
    filter = "ALL"
  }
}

/******************************************
  Route
 *****************************************/

resource "google_compute_route" "route" {
  project          = var.project_id
  name             = "${var.network_name}-nat-default-route"
  dest_range       = "0.0.0.0/0"
  network          = var.network_self_link
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}