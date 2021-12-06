/**
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/******************************************
  Network
 *****************************************/

resource "google_compute_network" "network" {
  project                         = var.project_id
  name                            = var.network_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}

/******************************************
  Subnet Network 1
 *****************************************/

resource "google_compute_subnetwork" "subnet_1" {
  provider      = google-beta
  project       = var.project_id
  ip_cidr_range = var.region_1_cidr
  name          = "${var.network_name}-${var.region_1}"
  network       = google_compute_network.network.self_link
  region        = var.region_1

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

}

/******************************************
  Subnet Network 2
 *****************************************/

resource "google_compute_subnetwork" "subnet_2" {
  provider      = google-beta
  project       = var.project_id
  ip_cidr_range = var.region_2_cidr
  name          = "${var.network_name}-${var.region_2}"
  network       = google_compute_network.network.self_link
  region        = var.region_2

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

}

/******************************************
  Firewall Rule
 *****************************************/

resource "google_compute_firewall" "firewall_rule_iap" {
  project         = var.project_id
  name            = "${var.network_name}-allow-iap-ingress-all"
  network         = google_compute_network.network.self_link
  direction       = "INGRESS"
  priority        = var.priority
  source_ranges   = ["35.235.240.0/20"]

  log_config {
    metadata = var.logging_metadata
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

}

/******************************************
  Cloud Router Region 1
 *****************************************/

resource "google_compute_router" "cloud_nat_router_region_1" {
  name    = "${var.network_name}-${var.region_1}-nat-router"
  project = var.project_id
  region  = var.region_1
  network = google_compute_network.network.self_link
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
  network = google_compute_network.network.self_link
  bgp {
    asn = var.cloud_router_asn_number_region_2
  }
}

/******************************************
  Cloud NAT Region 2
 *****************************************/

resource "google_compute_router_nat" "cloud_nat_region_2" {
  name                               = "${var.network_name}-${var.region_2}-nat"
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