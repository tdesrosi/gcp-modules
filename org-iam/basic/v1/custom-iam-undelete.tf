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
  Custom IAM
  Without this custom role you cannot recover project w/o Owner
 *****************************************/

resource "google_organization_iam_custom_role" "undelete" {
  org_id      = var.organization_id
  permissions = ["resourcemanager.projects.undelete"]
  role_id     = "custom_project_undelete"
  title       = "Undelete Project Permission"
}

resource "google_organization_iam_member" "undelete_role" {
  member = "user:${var.your_id}"
  org_id = var.organization_id
  role   = google_organization_iam_custom_role.undelete.id
}