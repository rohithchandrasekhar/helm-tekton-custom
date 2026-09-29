variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "project-635d894f-085c-4e31-a7d"
}

variable "region" {
  type        = string
  description = "GCP default region"
  default     = "us-central1"
}

variable "location" {
  type        = string
  description = "GCP zone or region for the cluster"
  default     = "us-central1-a"
}

variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster"
  default     = "dev-gke-cluster"
}