resource "google_compute_network" "devo-vpc" {
  name                    = "devo-vpc"
  project                 = "kthamel-gcloud"
  auto_create_subnetworks = false
  mtu                     = 1600
}

resource "google_tags_tag_key" "devo-tag-key" {
  parent = "organizations/628761461841"
  short_name = "Project"
  description = "Devoteam_IaC"
}

resource "google_tags_tag_value" "devo-tag-value" {
  parent = "tagKeys/${google_tags_tag_key.devo-tag-key}"
  short_name = "Gcloud_IAC"
  description = "Devoteam_IaC"
}

resource "google_compute_subnetwork" "devo-vpc-nodes-subnet" {
  name          = "devo-vpc-nodes-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.devo-vpc.id
  project       = google_compute_network.devo-vpc.project
}

resource "google_compute_subnetwork" "devo-vpc-pods-subnet" {
  name          = "evo-vpc-pods-subnet"
  ip_cidr_range = "10.1.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.devo-vpc.id
  project       = google_compute_network.devo-vpc.project
}

resource "google_compute_subnetwork" "devo-vpc-services-subnet" {
  name          = "devo-vpc-services-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = "us-west1"
  network       = google_compute_network.devo-vpc.id
  project       = google_compute_network.devo-vpc.project
}
