resource "google_compute_firewall" "ssh" {
  name    = "allow-ssh"
  network = var.network
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = [var.my_ip]
  target_tags   = var.target_tags
}

resource "google_compute_firewall" "http_https" {
  name    = "allow-http-https"
  network = var.network
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = var.target_tags
}