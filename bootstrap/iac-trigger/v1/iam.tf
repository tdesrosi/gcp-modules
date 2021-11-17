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

resource "google_project_iam_member" "cloud_build_sa_00_trigger" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/cloudbuild.builds.editor"
}

resource "google_project_iam_member" "sa_admin_sa_00_trigger" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/iam.serviceAccountAdmin"
}

resource "google_project_iam_member" "storage_admin_sa_00_trigger" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/storage.admin"
}

resource "google_project_iam_member" "sa_user_sa_00_trigger" {
  project = var.project_id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/iam.serviceAccountUser"
}

resource "google_storage_bucket_iam_member" "cloud_build_sa_00_trigger_gcs_backend" {
  bucket = google_storage_bucket.first_trigger_backend_state_bucket.id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/storage.admin"
}

resource "google_storage_bucket_iam_member" "cloud_build_sa_00_trigger_gcs_logs" {
  bucket = google_storage_bucket.cloud_build_logs_bucket.id
  member = "serviceAccount:${google_service_account.sa_00_trigger.email}"
  role   = "roles/storage.admin"
}