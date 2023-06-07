variable "user" {
  description = "Login information"
  type        = map
  default     = {
    username = "admin"
    password = "C1sco12345"
    url      = "https://10.10.20.14"
  }
}
variable "tenant" {
    type    = string
    default = "qms-tenant05"
}
variable "vrf" {
    type    = string
    default = "qms-tenant05-vrf"
}
variable "bd" {
    type    = string
    default = "qms-tenant05-bd"
}
variable "subnet" {
    type    = string
    default = "10.10.100.1/24"
}
