/******************************************
  Bucket to store all tf state files
 *****************************************/
resource "google_storage_bucket" "backend_state_bucket" {
  project   = var.project_id
  name      = "${var.gcs_bucket_unique_id}-terraform-backends-${random_string.random_string.result}"
  location  = var.gcs_terraform_bucket_location
  storage_class = "MULTI_REGIONAL"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

}


resource "google_storage_bucket_object" "backend_folders" {
  for_each = local.folder_list
  bucket = google_storage_bucket.backend_state_bucket.name
  // Trailing / will make this a directory
  name   = "${each.value}/"
  // below required despite note being used... :(
  content = "foo"
}

/******************************************
  Random String
 *****************************************/
resource "random_string" "random_string" {
  length    = 10
  lower     = true
  upper     = false
  special   = false
  numeric   = true
}