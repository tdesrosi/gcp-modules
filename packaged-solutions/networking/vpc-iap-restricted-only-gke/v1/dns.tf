/******************************************
  Cloud DNS - Internal googleapis
 *****************************************/

resource "google_dns_managed_zone" "restricted_api_zone" {
  project     = var.project_id
  name        = "restricted-api-zone-${random_string.random_string_for_api_zone.result}"
  dns_name    = "googleapis.com."
  description = "Google Restricted API Access"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_api_access_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_api_zone.name
  name          = "restricted.googleapis.com."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_api_access_cname_record" {
  project       = var.project_id
  name          = "*.googleapis.com."
  managed_zone  = google_dns_managed_zone.restricted_api_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["restricted.googleapis.com."]
}

/******************************************
  Cloud DNS - Internal - gcrio
 *****************************************/
# gcr.io
resource "google_dns_managed_zone" "restricted_gcr_io_zone" {
  project     = var.project_id
  name        = "restricted-gcr-io-zone-${random_string.random_string_for_gcrio_zone.result}"
  dns_name    = "gcr.io."
  description = "Google Restricted API Access - GCR IO"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_gcr_io_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_gcr_io_zone.name
  name          = "gcr.io."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_gcr_io_cname_record" {
  project       = var.project_id
  name          = "*.gcr.io."
  managed_zone  = google_dns_managed_zone.restricted_gcr_io_zone.name
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

/******************************************
  Cloud DNS - Internal - run app
 *****************************************/
# run.app
resource "google_dns_managed_zone" "restricted_run_app_zone" {
  project     = var.project_id
  name        = "restricted-run-app-zone-${random_string.random_string_for_runapp_zone.result}"
  dns_name    = "run.app."
  description = "Google Restricted API Access - Run App"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_run_app_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_run_app_zone.name
  name          = "run.app."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_run_app_cname_record" {
  project       = var.project_id
  name          = "*.run.app."
  managed_zone  = google_dns_managed_zone.restricted_run_app_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["run.app."]
}

resource "random_string" "random_string_for_runapp_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}

/******************************************
  Cloud DNS - Internal - pkg.dev
 *****************************************/
# pkg.dev
resource "google_dns_managed_zone" "restricted_pkg_dev_zone" {
  project     = var.project_id
  name        = "restricted-pkg-dev-zone-${random_string.random_string_for_pkg_dev_zone.result}"
  dns_name    = "pkg.dev."
  description = "Google Restricted API Access - pkg.dev"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_pkg_dev_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_pkg_dev_zone.name
  name          = "pkg.dev."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_pkg_dev_cname_record" {
  project       = var.project_id
  name          = "*.pkg.dev."
  managed_zone  = google_dns_managed_zone.restricted_pkg_dev_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["pkg.dev."]
}

resource "random_string" "random_string_for_pkg_dev_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}


/******************************************
  Cloud DNS - Internal - composer
 *****************************************/
# pkg.dev
resource "google_dns_managed_zone" "restricted_composer_zone" {
  project     = var.project_id
  name        = "restricted-composer-zone-${random_string.random_string_for_composer_zone.result}"
  dns_name    = "composer.cloud.google.com."
  description = "Google Restricted API Access - Composer"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_composer_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_composer_zone.name
  name          = "composer.cloud.google.com."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_composer_cname_record" {
  project       = var.project_id
  name          = "*.composer.cloud.google.com."
  managed_zone  = google_dns_managed_zone.restricted_composer_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["composer.cloud.google.com."]
}

resource "random_string" "random_string_for_composer_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}