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
variable "network_self_link" {}

variable "logging_metadata" {
  description = "Defaults to INCLUDE_ALL_METADATA."
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}

variable "region" {
  description = "Region the subnet will reside in"
  type        = string
}

variable "cidr" {
  type = string
}

variable "vpc_flow_log_interval" {
  default = "INTERVAL_5_MIN"
}

variable "vpc_flow_log_sampling" {
  default = 0.8
}