variable "subaccount_id" {
    type = string
}
variable "globalaccount" {
    type = string
}
variable "username" {
    type = string
}
variable "password" {
    type = string
}
variable "role" {
    type = string
}
 variable "users" {
  type        = list(string)
  description = "Defines the colleagues who are added to each subaccount as subaccount service administrators."
}
 variable "identity_provider" {
    type = string
}
