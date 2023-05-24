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
  iam_roles = toset(var.project_iam_roles_to_grant)

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
  member = "serviceAccount:${var.project_service_account}"
  role   = each.value
}

resource "google_project_iam_binding" "no_owner" {
  members = []
  project = google_project.project.project_id
  role    = "roles/owner"
}

resource "google_project_iam_binding" "no_editor" {
  members = []
  project = google_project.project.project_id
  role    = "roles/editor"
}

resource "google_project_iam_binding" "no_viewer" {
  members = []
  project = google_project.project.project_id
  role    = "roles/viewer"
}