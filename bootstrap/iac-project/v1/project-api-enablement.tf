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
  apis_to_enable = toset(concat(local.api_list, var.extra_apis_to_enable))

  api_list = [
    "accesscontextmanager.googleapis.com",
    "logging.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "servicemanagement.googleapis.com",
    "storage-component.googleapis.com",
    "storage-api.googleapis.com",
    "cloudbilling.googleapis.com",
    "billingbudgets.googleapis.com",
    "cloudbuild.googleapis.com",
    "container.googleapis.com",
    "secretmanager.googleapis.com",

    "accessapproval.googleapis.com",
    "notebooks.googleapis.com",
    "ml.googleapis.com",
    "meshca.googleapis.com",
    "apigee.googleapis.com",
    "apigeeconnect.googleapis.com",
    "artifactregistry.googleapis.com",
    "automl.googleapis.com",
    "bigquery.googleapis.com",
    "bigquerydatatransfer.googleapis.com",
    "binaryauthorization.googleapis.com",
    "privateca.googleapis.com",
    "cloudasset.googleapis.com",
    "bigtable.googleapis.com",
    "composer.googleapis.com",
    "datafusion.googleapis.com",
    "dlp.googleapis.com",
    "cloudfunctions.googleapis.com",
    "healthcare.googleapis.com",
    "cloudkms.googleapis.com",
    "monitoring.googleapis.com",
    "cloudprofiler.googleapis.com",
    "spanner.googleapis.com",
    "sqladmin.googleapis.com",
    "storage.googleapis.com",
    "tpu.googleapis.com",
    "cloudtrace.googleapis.com",
    "vision.googleapis.com",
    "compute.googleapis.com",
    "containeranalysis.googleapis.com",
    "containerregistry.googleapis.com",
    "datacatalog.googleapis.com",
    "dataflow.googleapis.com",
    "dataproc.googleapis.com",
    "metastore.googleapis.com",
    # "gameservices.googleapis.com", # Not supported in joonix
    "gkeconnect.googleapis.com",
    "gkehub.googleapis.com",
    "managedidentities.googleapis.com",
    "redis.googleapis.com",
    "language.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "pubsublite.googleapis.com",
    "vpcaccess.googleapis.com",
    "servicecontrol.googleapis.com",
    "servicedirectory.googleapis.com",
    "speech.googleapis.com",
    "storagetransfer.googleapis.com",
    "texttospeech.googleapis.com",
    "translate.googleapis.com",
    "videointelligence.googleapis.com",
    "osconfig.googleapis.com",
    "run.googleapis.com",

    "dns.googleapis.com",
    "networkconnectivity.googleapis.com",
    "networkmanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "networktopology.googleapis.com",
    "networksecurity.googleapis.com",
    "networkservices.googleapis.com",
    "cloudlatencytest.googleapis.com",
    "recommender.googleapis.com",

  ]
}

resource "google_project_service" "enable_api" {
  for_each           = local.apis_to_enable
  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}
