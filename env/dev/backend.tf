terraform {
  backend "gcs" {
    bucket = "rohith-terraform-tf-state-dev"
    prefix = "tekton-platform/dev"
  }
}