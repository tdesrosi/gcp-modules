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
  Audit Log Config
 *****************************************/

resource "google_organization_iam_audit_config" "set_read_for_all_except_you" {

  org_id  = var.organization_id
  service = "allServices"

  audit_log_config {
    log_type = "ADMIN_READ"
    exempted_members = ["user:${var.your_id}"]
  }

  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = ["user:${var.your_id}"]
  }

  audit_log_config {
    log_type = "DATA_WRITE"
    exempted_members = ["user:${var.your_id}"]
  }

}

/******************************************
  No Basic Roles!
 *****************************************/

resource "google_organization_iam_binding" "no_owner" {
  members = []
  org_id  = var.organization_id
  role    = "roles/owner"
}

resource "google_organization_iam_binding" "no_viewer" {
  members = []
  org_id  = var.organization_id
  role    = "roles/viewer"
}

resource "google_organization_iam_binding" "no_editor" {
  members = []
  org_id  = var.organization_id
  role    = "roles/editor"
}

/******************************************
  Org Admins
 *****************************************/

resource "google_organization_iam_binding" "org_admins" {
  members = [
    "user:${var.your_id}",
    "serviceAccount:${var.org_iam_org_policies_service_account_id}"
  ]
  org_id  = var.organization_id
  role    = "roles/resourcemanager.organizationAdmin"
}

/******************************************
  Org Policy Admins
 *****************************************/

resource "google_organization_iam_binding" "org_policy_admins" {
  members = [
    "user:${var.your_id}",
    "serviceAccount:${var.org_iam_org_policies_service_account_id}",
    "serviceAccount:${var.folder_structure_service_account_id}"
  ]
  org_id  = var.organization_id
  role    = "roles/orgpolicy.policyAdmin"
}

/******************************************
  Access Context Manager Admins
 *****************************************/

resource "google_organization_iam_binding" "access_context_manager_admins" {
  members = [
    "user:${var.your_id}",
    "serviceAccount:${var.access_context_manager_service_account_id}"
  ]
  org_id  = var.organization_id
  role    = "roles/orgpolicy.policyAdmin"
}


/******************************************
  Security Center Admins
 *****************************************/

resource "google_organization_iam_binding" "security_center_admins" {
  members = [
    "user:${var.your_id}",
  ]
  org_id  = var.organization_id
  role    = "roles/securitycenter.admin"
}

/******************************************
  External OS Login Users
 *****************************************/

resource "google_organization_iam_member" "os_login_user" {
  member = "user:${var.your_id}"
  org_id = var.organization_id
  role    = "roles/compute.osLoginExternalUser"
}

/******************************************
  Folder Admins
 *****************************************/

resource "google_organization_iam_binding" "folder_admins" {
  members = [
    "user:${var.your_id}",
    "serviceAccount:${var.folder_structure_service_account_id}"
  ]
  org_id  = var.organization_id
  role = "roles/resourcemanager.folderAdmin"
}