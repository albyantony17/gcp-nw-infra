resource "google_compute_network_peering" "peering"{
  name          = "${var.vpc_a}-to-${var.vpc_b}"
  network       = var.vpc_a
  peer_network  = var.vpc_b
}

resource "google_compute_network_peering" "peering_reverse"{
  name          = "${var.vpc_b}-to-${var.vpc_a}"
  network       = var.vpc_b
  peer_network  = var.vpc_a
}