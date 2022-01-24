/******************************************
  Cloud DNS - Internal
 *****************************************/

# googleapis
resource "google_dns_managed_zone" "private_googleapis_zone" {
  project     = var.project_id
  name        = "private-api-zone-${random_string.random_string_for_api_zone.result}"
  dns_name    = "googleapis.com."
  description = "Google Private API Access"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "private_googleapis_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.private_googleapis_zone.name
  name          = "private.googleapis.com."
  rrdatas       = ["199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "private_googleapis_cname_record" {
  project       = var.project_id
  name          = "*.googleapis.com."
  managed_zone  = google_dns_managed_zone.private_googleapis_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["private.googleapis.com."]
}

# gcr.io
resource "google_dns_managed_zone" "private_gcr_io_zone" {
  project     = var.project_id
  name        = "private-gcr-io-zone-${random_string.random_string_for_gcrio_zone.result}"
  dns_name    = "gcr.io."
  description = "Google Private API Access - GCR IO"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "private_gcr_io_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.private_gcr_io_zone.name
  name          = "gcr.io."
  rrdatas       = ["199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "private_gcr_io_cname_record" {
  project       = var.project_id
  name          = "*.gcr.io."
  managed_zone  = google_dns_managed_zone.private_gcr_io_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["gcr.io."]
}

resource "random_string" "random_string_for_api_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}

resource "random_string" "random_string_for_gcrio_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}