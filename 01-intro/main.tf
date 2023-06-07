terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
      version = "> 2.5.0"
    }
  }
}

# Configure the provider with your Cisco APIC credentials.
provider "aci" {
  username = "admin"
  password = "C1sco12345"
  url      = "https://10.10.20.14"
  insecure = true
}

# Define desired ACI tenant
resource "aci_tenant" "terraform_tenant" {
  name        = "qms-tenant01"
  description = "CISCOU Demo Tenant"
}
