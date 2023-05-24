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
  mapped_apis = toset(var.project_apis_to_enable)
}

resource "google_project_service" "enable_api" {
  depends_on          = [google_project.project]
  for_each            = local.mapped_apis
  project             = google_project.project.project_id
  service             = each.value
  disable_on_destroy  = false
}