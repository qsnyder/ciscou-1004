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
    default = "qms-tenant06"
}
variable "vrf" {
    type    = string
    default = "qms-tenant06-vrf"
}
variable "bd" {
    type    = string
    default = "qms-tenant06-bd"
}
variable "subnet" {
    type    = string
    default = "10.20.200.1/24"
}
