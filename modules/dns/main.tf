resource "google_dns_managed_zone" "public" {
  name     = "public-zone"
  dns_name = var.public_domine
}

resource "google_dns_record_set" "lb_a_record" {
  name         = var.domain_name
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.public.name
  rrdatas      = [var.lb_ip]
}

resource "google_dns_managed_zone" "private" {
  name       = "private-zone"
  dns_name   = var.private_domain
  visibility = "private"
  
  private_visibility_config {
    networks {
      network_url = var.network
    }
  }
}