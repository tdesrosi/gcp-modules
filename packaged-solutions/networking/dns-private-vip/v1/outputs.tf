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
  Outputs
 *****************************************/

output "dns_managed_zone_id" {
  value       = google_dns_managed_zone.private_googleapis_zone.id
  description = "ID for private zone created"
}

output "dns_record_set_a_record_id" {
  value       = google_dns_record_set.private_googleapis_a_record.id
  description = "ID for A record set created"
}

output "dns_record_set_cname_record_id" {
  value       = google_dns_record_set.private_googleapis_cname_record.id
  description = "ID for CNAME record set created"
}