resource "google_compute_instance_group" "web" {
  name = "web-igm"  
  zone = var.zone
}

resource "google_compute_backend_service" "backend" {
  name          = "backend-service"
  port_name     = "http"
  protocol      = "HTTP"
  timeout_sec   = 10
  backend {
    group = google_compute_instance_group.web.id
  }
}

resource "google_compute_global_forwarding_rule" "http" {
  name        = "http-farward"
  target      = google_compute_backend_service.backend.self_link
  port_range  = "80"
  ip_protocol = "TCP"
}

output "lb_ip" {
    value = google_compute_global_forwarding_rule.http.ip_address
}