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
  IAM
 *****************************************/

locals {
  iam_roles = toset(local.iam_role_list)

  iam_role_list = [
    "roles/iam.serviceAccountAdmin",
    "roles/monitoring.admin",
    "roles/logging.admin",
    "roles/bigquery.admin",
    "roles/storage.admin",
    "roles/compute.admin",
    "roles/dns.admin",
    "roles/cloudbuild.builds.editor",
    "roles/containeranalysis.admin",
    "roles/container.admin",
    "roles/cloudfunctions.admin",
    "roles/run.admin",
    "roles/artifactregistry.admin",
    "roles/dataflow.admin",
    "roles/pubsub.admin",
    "roles/vpcaccess.admin",
    "roles/datacatalog.admin",
    "roles/secretmanager.admin",
    "roles/cloudkms.admin",
    "roles/servicedirectory.admin",
    "roles/networkmanagement.admin",
    "roles/networkconnectivity.hubAdmin",
    "roles/dlp.admin",
    "roles/resourcemanager.projectIamAdmin",
  ]
}

resource "google_project_iam_member" "iam_member" {
  for_each = local.iam_roles
  project = google_project.project.project_id
  member = "group:${var.project_admin_group}"
  role   = each.value
}

resource "google_project_iam_member" "service_account_iam_member" {
  for_each = local.iam_roles
  project = google_project.project.project_id
  member = "serviceAccount:${var.project_admin_group}"
  role   = each.value
}