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
  Input Variables
 *****************************************/

variable "project_id_category" {
  description = "A  category to help distinguish this set of projects from another set"
  type        = string
}

variable "project_id_unique" {
  description = "A unique descriptor for your project"
  type        = string
}

variable "folder_id" {
  description = "The folder ID of where the project will reside."
  type        = string
}

variable "billing_account_id" {
  description = "Billing Account ID where costs of the project will be charged."
  type        = string
}

variable "project_admin_group" {
  description = "Group responsible for administration of this project"
  type        = string
}

variable "project_service_account" {
  description = "Service Account responsible for deploying resources in the project"
  type = string
}

variable "iam_admin_service_accounts" {
  description = "Service accounts which will need IAM permission to add permissions (e.g. add Network User)."
  type = string
}