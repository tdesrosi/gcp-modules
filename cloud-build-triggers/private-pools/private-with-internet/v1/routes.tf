
/******************************************
  Route
 *****************************************/

resource "google_compute_route" "route" {
  project          = var.project_id
  name             = "private-api-access-route"
  dest_range       = "199.36.153.8/30"
  network          = google_compute_network.network.self_link
  next_hop_gateway = "default-internet-gateway"
  priority         = 500
}

resource "google_compute_route" "route" {
  project          = var.project_id
  name             = "${var.network_name}-nat-default-route"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.network.self_link
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}