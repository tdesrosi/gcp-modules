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
  APIs
 *****************************************/

locals {
  mapped_apis = toset(local.apis_to_enable)

  apis_to_enable = [
    "logging.googleapis.com",
    "cloudbuild.googleapis.com",
    "container.googleapis.com",
    "secretmanager.googleapis.com",
    "artifactregistry.googleapis.com",
    "bigquery.googleapis.com",
    "cloudfunctions.googleapis.com",
    "monitoring.googleapis.com",
    "storage.googleapis.com",
    "compute.googleapis.com",
    "containeranalysis.googleapis.com",
    "containerregistry.googleapis.com",
    "datacatalog.googleapis.com",
    "dataflow.googleapis.com",
    "gkeconnect.googleapis.com",
    "gkehub.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "vpcaccess.googleapis.com",
    "servicedirectory.googleapis.com",
    "osconfig.googleapis.com",
    "run.googleapis.com",
    "dns.googleapis.com",
    "cloudkms.googleapis.com",
    "networkconnectivity.googleapis.com",
    "networkmanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "networktopology.googleapis.com",
    "networksecurity.googleapis.com",
    "networkservices.googleapis.com",
    "recommender.googleapis.com",
    "dlp.googleapis.com",
  ]
}

resource "google_project_service" "enable_api" {
  depends_on          = [google_project.project]
  for_each            = local.mapped_apis
  project             = google_project.project.project_id
  service             = each.value
  disable_on_destroy  = false
}