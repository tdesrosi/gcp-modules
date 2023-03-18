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
  Varables
 *****************************************/

variable "organization_id" {
  type        = string
}

variable "domain_identities" {
  type        = list(string)
  description = "Root domain identities. Allows all users with identity in domain to see org node. Helps users know they are working within appropriate space"
}

variable "domain_contacts" {
  type = list(string)
  description = "Domains allowed for essential contacts"
}