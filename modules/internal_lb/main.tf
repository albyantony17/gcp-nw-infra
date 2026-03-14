resource "google_compute_region_instance_group" "internal" {
  name    = "internal-igm"
  region  = var.region  
}

resource "google_compute_backend_service" "internal" {
  name          = "internal-backend"
  protocol      = "TCP"
  backend {
    group = google_compute_region_instance_group.internal_id
  }  
}

resource "google_comput_forwarding_rule" "internal" {
  name                      = "internal-tcp"
  region                    = var.region
  load_balancing_scheme     = "INTERNAL"
  backend_service           = google_compute_backend_service.internal_id
  ip_protocol               = "TCP"
  network                   = var.network
  subnetwork                = var.subnet
}