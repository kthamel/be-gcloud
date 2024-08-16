resource "google_container_cluster" "devo-gke-cluster" {
  name = "devo-gke-cluster"
  location                 = "us-west1-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  project                  = "kthamel-gcloud"
  network                  = google_compute_network.devo-vpc.id
  subnetwork               = google_compute_subnetwork.devo-vpc-subnet.id
  deletion_protection      = false

  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
}

resource "google_container_node_pool" "devo-gke-cluster-nodes" {
  name       = "devo-gke-cluster-nodes"
  project    = "kthamel-gcloud"
  cluster    = google_container_cluster.devo-gke-cluster.id
  node_count = 1

  autoscaling {
    min_node_count = 5
    max_node_count = 8
  }

  node_config {
    preemptible  = true
    machine_type = "e2-medium"
    disk_size_gb = 20
    labels = {
      name = "system-node"
    }
  }
}
