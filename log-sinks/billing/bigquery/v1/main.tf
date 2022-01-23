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
  BigQuery Dataset
 *****************************************/

resource "google_bigquery_dataset" "sink_dataset" {
  project       = var.project_id
  friendly_name = var.bigquery_dataset_friendly_name
  location      = var.bigquery_dataset_location
  dataset_id    = var.bigquery_dataset_id

}

/******************************************
  Billing Log Sink
 *****************************************/

resource "google_logging_billing_account_sink" "billing_log_sink" {
  billing_account = var.billing_account
  destination     = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.sink_dataset.dataset_id}"
  name            = var.sink_name
  filter          = var.sink_filter
}

/******************************************
  BigQuery IAM
 *****************************************/

/*
  IAM set inside bq resource block
  Writer identity only provided after sink created
  Sink created after dataset available
  Until BQ IAM may be altered in another resource block, must manually add writer identity or add to project IAM
*/

