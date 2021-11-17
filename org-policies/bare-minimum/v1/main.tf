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
  Org Policies
  (Grant exceptions at lower level)
  Check link below for new policies available
  https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints
 *****************************************/

/******************************************
  App Engine
 *****************************************/

# Disable Source Code Download
resource "google_organization_policy" "app_eng_disable_code_download" {
  constraint = "constraints/appengine.disableCodeDownload"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}

/******************************************
  Cloud SQL
 *****************************************/

# Restrict Public IP access on Cloud SQL instances
resource "google_organization_policy" "cloud_sql_restrict_public_ip" {
  constraint  = "constraints/sql.restrictPublicIp"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

/******************************************
  Cloud Storage
 *****************************************/

# Enforce uniform bucket-level access
resource "google_organization_policy" "gcs_no_public_access" {
  constraint  = "constraints/storage.publicAccessPrevention"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

/******************************************
  Compute Engine
 *****************************************/

# Disable VM nested virtualization
resource "google_organization_policy" "gce_disable_nested_virtualization" {
  constraint = "constraints/compute.disableNestedVirtualization"
  org_id = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable VM serial port access
resource "google_organization_policy" "gce_disable_serial_port_access" {
  constraint  = "compute.disableSerialPortAccess"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable VM serial port logging to Stackdriver	(Cloud Operations)
resource "google_organization_policy" "gce_disable_serial_port_logging" {
  constraint  = "compute.disableSerialPortLogging"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Require OS Login
resource "google_organization_policy" "gce_require_os_login" {
  constraint  = "constraints/compute.requireOsLogin"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Shielded VMs
resource "google_organization_policy" "gce_require_shielded_vm" {
  constraint  = "constraints/compute.requireShieldedVm"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Skip default network creation
resource "google_organization_policy" "gce_skip_default_network_creation" {
  constraint  = "constraints/compute.skipDefaultNetworkCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Define allowed external IPs for VM instances
resource "google_organization_policy" "gce_vm_external_ip_access" {
  constraint  = "compute.vmExternalIpAccess"
  org_id      = var.organization_id

  list_policy {
    deny {
      all = true
    }
  }

}

/******************************************
  Identity and Access Management
 *****************************************/

# Allow extending lifetime of OAuth 2.0 access tokens to up to 12 hours
# Do not wish to use this at the Org node level, but rather in specific use cases.

# Domain restricted sharing
resource "google_organization_policy" "iam_allowed_policy_member_domains" {
  constraint  = "iam.allowedPolicyMemberDomains"
  org_id      = var.organization_id

  list_policy {
    allow {
      values = var.domain_identities
    }
  }

}

# Disable service account key creation
resource "google_organization_policy" "iam_disable_service_account_key_creation" {
  constraint  = "iam.disableServiceAccountKeyCreation"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

# Disable Service Account Key Upload
resource "google_organization_policy" "iam_disable_service_account_key_upload" {
  constraint  = "constraints/iam.disableServiceAccountKeyUpload"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}

/******************************************
  Service Customer Management
 *****************************************/

# Disable Automatic IAM Grants for Default Service Accounts
resource "google_organization_policy" "scm_automatic_iam_grants_for_default_service_accounts" {
  constraint  = "iam.automaticIamGrantsForDefaultServiceAccounts"
  org_id      = var.organization_id

  boolean_policy {
    enforced = true
  }

}