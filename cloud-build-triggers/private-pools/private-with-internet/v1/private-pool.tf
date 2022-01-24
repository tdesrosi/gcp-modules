
/******************************************
  Private Pool
 *****************************************/

resource "google_cloudbuild_worker_pool" "pipelines_private_pool" {
  depends_on = [google_service_networking_connection.private_pool]
  project = "tf-iac"
  location = "us-central1"

  name     = "cloud-build-private-pool"

  worker_config {
    disk_size_gb    = 100
    machine_type    = "e2-standard-8"
    no_external_ip  = true
  }

  network_config {
    peered_network = google_compute_network.network.id
  }

}
