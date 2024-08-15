resource "google_compute_network" "devo-vpc" {
  name                    = "devo-vpc"
  project                 = "terraform-gcp-infrastructure"
  auto_create_subnetworks = false
  mtu                     = 1600
}

resource "google_compute_subnetwork" "devo-vpc-nodes-subnet" {
  name          = "devo-vpc-us-west1"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.devo-vpc.id
  project       = google_compute_network.devo-vpc.project
}

resource "google_compute_subnetwork" "devo-vpc-pods-subnet" {
  name          = "devo-vpc-us-west1"
  ip_cidr_range = "10.1.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.devo-vpc.id
  project       = google_compute_network.devo-vpc.project
}

resource "google_compute_subnetwork" "devo-vpc-services-subnet" {
  name          = "devo-vpc-us-west1"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.devo-vpc.id
  project       = google_compute_network.devo-vpc.project
}
