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
  Set project IAM
 *****************************************/
locals {
  roles_to_grant = toset(local.role_list)

  role_list = [
    "roles/cloudbuild.builds.editor",
    "roles/monitoring.admin",
    "roles/logging.admin",
    "roles/iam.serviceAccountAdmin",
    "roles/storage.admin",
    "roles/resourcemanager.projectIamAdmin"
  ]
}

resource "google_project_iam_member" "iam_member" {
  for_each  = local.roles_to_grant
  project = google_project.project.project_id
  member    = "user:${var.user_id}"
  role      = each.value
}