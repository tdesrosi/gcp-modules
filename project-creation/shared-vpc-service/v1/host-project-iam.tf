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

resource "google_project_iam_member" "cloud_services" {
  depends_on = [google_project_service.enable_api, google_project.project, google_compute_shared_vpc_service_project.project_to_shared_service]
  project = var.host_project_id
  member  = "serviceAccount:${google_project.project.number}@cloudservices.gserviceaccount.com"
  role    = "roles/compute.networkUser"
}

resource "google_project_iam_member" "project_admin_group_host" {
  depends_on = [google_project_service.enable_api, google_project.project, google_compute_shared_vpc_service_project.project_to_shared_service]
  project = var.host_project_id
  member  = "group:${var.project_admin_group}"
  role    = "roles/compute.networkUser"
}

resource "google_project_iam_member" "project_admin_service_account_host" {
  depends_on = [google_project_service.enable_api, google_project.project, google_compute_shared_vpc_service_project.project_to_shared_service]
  project = var.host_project_id
  member  = "serviceAccount:${var.project_service_account}"
  role    = "roles/compute.networkUser"
}


resource "google_project_iam_member" "gke_engine_robot_net_user" {
  depends_on = [google_project_service.enable_api, google_project.project, google_compute_shared_vpc_service_project.project_to_shared_service]
  project = var.host_project_id
  member = "serviceAccount:service-${google_project.project.number}@container-engine-robot.iam.gserviceaccount.com"
  role    = "roles/compute.networkUser"
}

resource "google_project_iam_member" "gke_engine_robot_host_service_agent" {
  depends_on = [google_project_service.enable_api, google_project.project, google_compute_shared_vpc_service_project.project_to_shared_service]
  project = var.host_project_id
  member = "serviceAccount:service-${google_project.project.number}@container-engine-robot.iam.gserviceaccount.com"
  role    = "roles/container.hostServiceAgentUser"
}

resource "google_project_iam_member" "gke_engine_robot_compute_security_admin" {
  depends_on = [google_project_service.enable_api, google_project.project, google_compute_shared_vpc_service_project.project_to_shared_service]
  project = var.host_project_id
  member = "serviceAccount:service-${google_project.project.number}@container-engine-robot.iam.gserviceaccount.com"
  role    = "roles/compute.securityAdmin"
}
