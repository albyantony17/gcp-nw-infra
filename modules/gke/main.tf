resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region
 
  remove_default_node_pool = true
  initial_node_count       = 1
 
  networking_mode = "VPC_NATIVE"
 
  ip_allocation_policy {}
 
  release_channel {
    channel = "REGULAR"
  }
}
 
resource "google_container_node_pool" "primary_nodes" {
  name     = "${var.cluster_name}-node-pool"
  cluster  = google_container_cluster.gke.name
  location = var.region
 
  node_count = var.node_count
 
  node_config {
    machine_type = var.machine_type
 
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
 
    labels = {
      env = "dev"
    }
  }
}