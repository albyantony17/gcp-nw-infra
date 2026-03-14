resource "google_compute_vpn_gateway" "vpn" {
  name          = var.gateway_name
  network       = var.network
  region        = var.region  
}

resource "google_compute_vpn_tunnel" "tunnel" {
  name                    = var.tunnel_name
  region                  = var.region
  target_vpn_gateway      = google_compute_vpn_gateway.vpn.id
  peer_ip                 = var.peer_ip
  shared_secret           = var.shared_secret
  local_traffic_selector  = var.local_cidr
  remote_traffic_selector = var.remote_cidr
}