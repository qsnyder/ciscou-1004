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

# Tenant CTX's BD
resource "aci_bridge_domain" "terraform_bd" {
    tenant_dn          = aci_tenant.terraform_tenant.id
    relation_fv_rs_ctx = aci_vrf.terraform_vrf.id
    description        = "CISCOU Demo Tenant BD"
    name               = var.bd
}

# Tenant BD's subnet
resource "aci_subnet" "terraform_bd_subnet" {
    parent_dn   = aci_bridge_domain.terraform_bd.id
    description = "CISCOU Demo Tenant Subnet"
    ip          = var.subnet
}

# Tenant VRF (CTX)
resource "aci_vrf" "terraform_vrf" {
    tenant_dn   = aci_tenant.terraform_tenant.id
    description = "DCISCOU Demo Tenant VRF"
    name        = var.vrf
}

# Define desired ACI tenant
resource "aci_tenant" "terraform_tenant" {
    name        = var.tenant
    description = "CISCOU Demo Tenant"
}