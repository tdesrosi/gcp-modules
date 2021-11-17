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
  Bucket to store all cloud build logs
 *****************************************/
resource "google_storage_bucket" "cloud_build_logs_bucket" {
  project   = var.project_id
  name      = "cloud-build-logs-${random_string.build_logs_random_string.result}"
  location  = var.gcs_terraform_backend_bucket_location
  storage_class = "MULTI_REGIONAL"

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

}

/******************************************
  Random String
 *****************************************/
resource "random_string" "build_logs_random_string" {
  length    = 35
  lower     = true
  upper     = false
  special   = false
  number    = true
}