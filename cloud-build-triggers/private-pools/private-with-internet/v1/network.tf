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
  Network
 *****************************************/

resource "google_compute_network" "network" {
  project                         = var.project_id
  name                            = var.network_name
  routing_mode                    = "GLOBAL"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

/******************************************
  Subnet Network 1
 *****************************************/

resource "google_compute_subnetwork" "subnet" {
  provider      = google-beta
  project       = var.project_id
  ip_cidr_range = var.cidr
  name          = "${var.network_name}-${var.region}"
  network       = google_compute_network.network.self_link
  region        = var.region

  private_ip_google_access = true

  log_config {
    aggregation_interval  = var.vpc_flow_log_interval
    flow_sampling         = var.vpc_flow_log_sampling
    metadata              = "INCLUDE_ALL_METADATA"
  }

}
