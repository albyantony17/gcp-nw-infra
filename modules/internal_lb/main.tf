resource "google_compute_instance_group" "internal" {
  name = "internal-igm"
  zone = var.zone
}

resource "google_compute_region_backend_service" "internal" {
  name     = "internal-backend"
  protocol = "TCP"
  region   = var.region

  backend {
    group = google_compute_instance_group.internal.id
  }
}

resource "google_compute_forwarding_rule" "internal" {
  name                  = "internal-tcp"
  region                = var.region
  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.internal.id
  ip_protocol           = "TCP"
  ports                 = ["80"]

  network    = var.network
  subnetwork = var.subnet
}