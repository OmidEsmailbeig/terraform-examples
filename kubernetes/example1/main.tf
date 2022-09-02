resource "kubernetes_service" "nginx" {
  metadata {
    name      = var.nginx_name
    namespace = var.nginx_namespace
    labels    = var.nginx_labels
  }
  spec {
    type     = "NodePort"
    selector = var.nginx_labels
    port {
      name = "http"
      port = 80
    }
  }
}
resource "kubernetes_pod" "nginx" {
  metadata {
    name      = var.nginx_name
    namespace = var.nginx_namespace
    labels    = var.nginx_labels
  }
  spec {
    container {
      image = "nginx"
      name  = "nginx-1"
      port {
        container_port = "80"
      }
    }
  }
  depends_on = [
    kubernetes_service.nginx
  ]
}
