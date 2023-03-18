/******************************************
  Firewall Rule
 *****************************************/

resource "google_compute_firewall" "firewall_rule_iap" {
  project         = var.project_id
  name            = "${var.network_name}-allow-iap-ingress-all"
  network         = google_compute_network.network.self_link
  direction       = "INGRESS"
  priority        = 1000
  source_ranges   = ["35.235.240.0/20"]

  log_config {
    metadata = var.logging_metadata
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

}

resource "google_compute_firewall" "firewall_rule_allow_gcp_apis_range" {
  project         = var.project_id
  name            = "${var.network_name}-allow-gcp-apis"
  network         = google_compute_network.network.self_link
  direction       = "EGRESS"
  priority        = 1000
  destination_ranges   = ["199.36.153.4/30"]

  log_config {
    metadata = var.logging_metadata
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

}

resource "google_compute_firewall" "firewall_rule_deny_all_egress" {
  project             = var.project_id
  name                = "${var.network_name}-deny-all-egress-all"
  network             = google_compute_network.network.self_link
  direction           = "EGRESS"
  priority            = 65000
  destination_ranges  = ["0.0.0.0/0"]

  log_config {
    metadata = var.logging_metadata
  }

  deny {
    protocol = "tcp"
  }

  deny {
    protocol = "udp"
  }

  deny {
    protocol = "icmp"
  }

  deny {
    protocol = "ipip"
  }

}

resource "google_compute_firewall" "firewall_rule_deny_all_ingress" {
  project         = var.project_id
  name            = "${var.network_name}-deny-all-ingress-all"
  network         = google_compute_network.network.self_link
  direction       = "INGRESS"
  priority        = 65000
  source_ranges   = ["0.0.0.0/0"]

  log_config {
    metadata = var.logging_metadata
  }

  deny {
    protocol = "tcp"
  }

  deny {
    protocol = "udp"
  }

  deny {
    protocol = "icmp"
  }

  deny {
    protocol = "ipip"
  }

}