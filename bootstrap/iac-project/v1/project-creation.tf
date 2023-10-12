# /**
#  *
#  * Licensed under the Apache License, Version 2.0 (the "License");
#  * you may not use this file except in compliance with the License.
#  * You may obtain a copy of the License at
#  *
#  *      http://www.apache.org/licenses/LICENSE-2.0
#  *
#  * Unless required by applicable law or agreed to in writing, software
#  * distributed under the License is distributed on an "AS IS" BASIS,
#  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  * See the License for the specific language governing permissions and
#  * limitations under the License.
#  */


######

# Commenting this file out, as billing must be attached manually.


# /******************************************
#   Project Creation
#  *****************************************/

# resource "google_project" "project" {
#   name            = "IaC Project"
#   project_id      = "${var.unique_project_id}-iac-${random_string.random_string.result}"
#   org_id          = var.org_id
#   billing_account = var.billing_account_id
# }

# /******************************************
#   Random String
#  *****************************************/
# resource "random_string" "random_string" {
#   length    = 4
#   lower     = true
#   upper     = false
#   special   = false
#   numeric    = true
# }