# 1. Call the remote GKE module from your main terraform_gcp_custom repository
module "gke" {
  source = "git::https://github.com/rohithchandrasekhar/terraform_gcp_custom.git//modules/gke-cluster?ref=main"

  project_id          = var.project_id
  cluster_name        = var.cluster_name
  location            = var.location
  deletion_protection = false
}

# 2. Install Tekton Pipelines using Helm Release
resource "helm_release" "tekton_pipeline" {
  name             = "tekton-pipeline"
  repository       = "https://cdfoundation.github.io/tekton-helm-chart/"
  chart            = "tekton-pipeline"
  namespace        = "tekton-pipelines"
  create_namespace = true

  timeout = 600
}