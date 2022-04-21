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
  Variables
 *****************************************/

variable "project_id" {
  description = "Identifies project which hosts the VPC where this rule will be applied."
  type        = string
}

variable "network_name" {
  type        = string
}

variable "logging_metadata" {
  description = "Defaults to INCLUDE_ALL_METADATA."
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}

variable "region_1" {
  description = "Region the subnet will reside in"
  type        = string
  default     = "us-east4"
}

variable "region_2" {
  description = "Region the subnet will reside in"
  type        = string
  default     = "us-central1"
}

variable "region_1_cidr" {
  default = "10.0.0.0/19"
}

variable "region_1_pod_cidr" {
  default = "192.168.0.0/18"
}

variable "region_1_services_cidr" {
  default = "172.16.0.0/20"
}

variable "region_2_cidr" {
  default = "10.0.32.0/19"
}

variable "region_2_pod_cidr" {
  default = "192.168.128.0/18"
}

variable "region_2_services_cidr" {
  default = "172.24.0.0/20"
}

variable "vpc_flow_log_interval" {
  default = "INTERVAL_5_MIN"
}

variable "vpc_flow_log_sampling" {
  default = 0.8
}


variable "cloud_router_asn_number_region_1" {
  default = 4200000501
}

variable "cloud_router_asn_number_region_2" {
  default = 4200000601
}
