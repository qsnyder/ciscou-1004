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
    default = "qms-tenant02"
}