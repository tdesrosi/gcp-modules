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
  Cloud DNS - Internal - Notebooks
 *****************************************/
resource "google_dns_managed_zone" "restricted_notebooks_zone" {
  project     = var.project_id
  name        = "restricted-notebooks-zone-${random_string.random_string_for_notebooks_zone.result}"
  dns_name    = "notebooks.googleapis.com."
  description = "Google Restricted API Access - Notebooks"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_notebooks_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_notebooks_cloud_zone.name
  name          = "notebooks.googleapis.com."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_notebooks_cname_record" {
  project       = var.project_id
  name          = "*.notebooks.googleapis.com."
  managed_zone  = google_dns_managed_zone.restricted_notebooks_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["notebooks.googleapis.com."]
}

resource "random_string" "random_string_for_notebooks_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}


/******************************************
  Cloud DNS - Internal - Notebooks Cloud Google
 *****************************************/
resource "google_dns_managed_zone" "restricted_notebooks_cloud_zone" {
  project     = var.project_id
  name        = "restricted-notebooks-cloud-zone-${random_string.random_string_for_notebooks_cloud_zone.result}"
  dns_name    = "notebooks.cloud.google.com."
  description = "Google Restricted API Access - Notebooks Cloud"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_notebooks_cloud_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_notebooks_cloud_zone.name
  name          = "notebooks.cloud.google.com."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_notebooks_cloud_cname_record" {
  project       = var.project_id
  name          = "*.notebooks.cloud.google.com."
  managed_zone  = google_dns_managed_zone.restricted_notebooks_cloud_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["notebooks.cloud.google.com."]
}

resource "random_string" "random_string_for_notebooks_cloud_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}

/******************************************
  Cloud DNS - Internal - Notebooks Cloud UserContent
 *****************************************/
resource "google_dns_managed_zone" "restricted_notebooks_usercontent_zone" {
  project     = var.project_id
  name        = "restricted-notebooks-usercontent-zone-${random_string.random_string_for_notebooks_usercontent_zone.result}"
  dns_name    = "notebooks.googleusercontent.com."
  description = "Google Restricted API Access - Notebooks Usercontent"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_notebooks_usercontent_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_notebooks_usercontent_zone.name
  name          = "notebooks.googleusercontent.com."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_notebooks_usercontent_cname_record" {
  project       = var.project_id
  name          = "*.notebooks.googleusercontent.com."
  managed_zone  = google_dns_managed_zone.restricted_notebooks_usercontent_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["notebooks.googleusercontent.com."]
}

resource "random_string" "random_string_for_notebooks_usercontent_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}


/******************************************
  Cloud DNS - Internal - Tunnel IAP
 *****************************************/
resource "google_dns_managed_zone" "restricted_iapproxy_zone" {
  project     = var.project_id
  name        = "restricted-notebooks-iapproxy-zone-${random_string.random_string_for_iapproxy_zone.result}"
  dns_name    = "tunnel.cloudproxy.app."
  description = "Google Restricted API Access - IAP Tunnel Proxy"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_iapproxy_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_iapproxy_zone.name
  name          = "tunnel.cloudproxy.app."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_iapproxy_cname_record" {
  project       = var.project_id
  name          = "*.tunnel.cloudproxy.app."
  managed_zone  = google_dns_managed_zone.restricted_iapproxy_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["tunnel.cloudproxy.app."]
}

resource "random_string" "random_string_for_iapproxy_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}

/******************************************
  Cloud DNS - Internal - Functions Net
 *****************************************/
resource "google_dns_managed_zone" "restricted_functions_zone" {
  project     = var.project_id
  name        = "restricted-notebooks-functions-zone-${random_string.random_string_for_functions_zone.result}"
  dns_name    = "cloudfunctions.net."
  description = "Google Restricted API Access - Functions"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_functions_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_functions_zone.name
  name          = "cloudfunctions.net."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_functions_cname_record" {
  project       = var.project_id
  name          = "*.cloudfunctions.net."
  managed_zone  = google_dns_managed_zone.restricted_functions_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["cloudfunctions.net."]
}

resource "random_string" "random_string_for_functions_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}

/******************************************
  Cloud DNS - Internal - pkg.dev
 *****************************************/
resource "google_dns_managed_zone" "restricted_pkgdev_zone" {
  project     = var.project_id
  name        = "restricted-notebooks-pkgdev-zone-${random_string.random_string_for_pkgdev_zone.result}"
  dns_name    = "pkg.dev."
  description = "Google Restricted API Access - pkgdev"
  visibility  = "private"

  private_visibility_config {
    networks {
      network_url =  google_compute_network.network.self_link
    }
  }
}

resource "google_dns_record_set" "restricted_pkgdev_a_record" {
  project       = var.project_id
  managed_zone  = google_dns_managed_zone.restricted_pkgdev_zone.name
  name          = "pkg.dev."
  rrdatas       = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
  ttl           = 300
  type          = "A"
}

resource "google_dns_record_set" "restricted_pkgdev_cname_record" {
  project       = var.project_id
  name          = "*.pkg.dev."
  managed_zone  = google_dns_managed_zone.restricted_pkgdev_zone.name
  type          = "CNAME"
  ttl           = 300
  rrdatas       = ["pkg.dev."]
}

resource "random_string" "random_string_for_pkgdev_zone" {
  length = 4
  lower = true
  upper = false
  special = false
  number = true
}