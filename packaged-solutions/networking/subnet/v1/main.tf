/******************************************
  Subnet
 *****************************************/

resource "google_compute_subnetwork" "subnet" {
  project       = var.project_id
  ip_cidr_range = var.cidr
  name          = "${var.network_name}-${var.region}"
  network       = var.network_self_link
  region        = var.region

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

}