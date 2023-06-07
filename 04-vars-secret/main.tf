terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

# Configure the provider with your Cisco APIC credentials.
provider "aci" {
  username = var.user.username
  password = var.user.password
  url      = var.user.url
  insecure = true
}

# Define desired ACI tenant
resource "aci_tenant" "terraform_tenant" {
    name        = var.tenant
    description = "DEVLIT2785 Demo Tenant"
}