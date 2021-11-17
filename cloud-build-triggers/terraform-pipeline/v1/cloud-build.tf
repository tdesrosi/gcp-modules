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
  Plan Trigger
 *****************************************/

resource "google_cloudbuild_trigger" "push_and_plan_trigger" {
  depends_on = [google_service_account.cloud_build_service_account]
  for_each = local.folder_list
  name = "${each.value}-push-and-plan"
  project = var.project_id

  service_account = "projects/${var.project_id}/serviceAccounts/cbsa-${each.value}@${var.project_id}.iam.gserviceaccount.com"

  github {
    owner = var.github_repo_owner
    name = var.github_repo_name
    push {
      branch = var.push_branch_trigger_plan
    }
  }

  included_files = ["${each.value}/**"]

  build {

    // Required when using customer SA rather tha cloud build SA
    // Location to write logs to for the run
    logs_bucket = "${google_storage_bucket.cloud_build_logs_bucket.url}/${each.value}"


    step {
      name = "hashicorp/terraform"
      dir = "./${each.value}/"
      args = ["init"]
    }
    step {
      name = "hashicorp/terraform"
      dir = "./${each.value}/"
      args = ["plan"]
    }
    timeout = "7200s"
  }


}