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
  Set project and bucket IAM
 *****************************************/
// Assumes that the same SA will be used for every pipeline listed for "folders" so do not need to apply multiple times
resource "google_storage_bucket_iam_member" "cloud_build_sa_backend_gcs_bucket" {
  bucket = google_storage_bucket.backend_state_bucket.id
  member = "serviceAccount:${var.pipeline_service_account}"
  role   = "roles/storage.admin"
}

resource "google_storage_bucket_iam_member" "cloud_build_sa_cloud_build_logs_gcs_bucket" {
  bucket = google_storage_bucket.cloud_build_logs_bucket.id
  member = "serviceAccount:${var.pipeline_service_account}"
  role   = "roles/storage.admin"
}

resource "google_storage_bucket_iam_member" "cloud_build_sa_tfvars_gcs_bucket" {
  for_each = local.folder_list
  bucket = google_storage_bucket.tfvars_files_bucket.id
  member = "serviceAccount:${var.pipeline_service_account}"
  role   = "roles/storage.objectViewer"
}