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
  Create Service Account to run pipeline for 00-trigger
 *****************************************/

# tdesrosi@ Importing an existing service account I had as this was already 
# set up with billing.
import {
  to = google_service_account.cloud_build_service_account
  id = "cbsa-${each.value}"
}

resource "google_service_account" "cloud_build_service_account" {
  for_each    = local.folder_list
  account_id  = "cbsa-${each.value}"
  description = "Cloud Build Service Account (cbsa) for ${each.value} pipeline"
  project     = var.project_id
}
