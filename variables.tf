variable "nginx_name" {
  type    = string
  default = "nginx"
}
variable "nginx_namespace" {
  type    = string
  default = "default"
}
variable "nginx_labels" {
  type = map(string)
  default = {
    "app.kubernetes.io/name"       = "nginx"
    "app.kubernetes.io/created-by" = "Omid"
  }
}
