output "nginx_address" {
  value = "http://192.168.122.47:${kubernetes_service.nginx.spec[0].port[0].node_port}"
}
