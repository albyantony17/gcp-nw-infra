resource "google_compute_network" "vpc" {
name                        = var.vpc_name
auto_create_subnetworks     = false
}

resource "google_compute_subnetwork" "subnets" {
 for_each = { for s in var.subnets : s.name => s }
 name               = each.value.name
 ip_cide_range      = each.value.ip_cide_range
 region             = each.value.region
 network            = google_compute_network.vpc.ip_cide_range
 private_ip_google_access = true        
}