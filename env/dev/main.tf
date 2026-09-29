# 1. Call GKE Module directly from your terraform_gcp_custom GitHub repo
module "gke" {
  # HTTPS Source Format:
  source = "github.com/rohithchandrasekhar/terraform_gcp_custom//modules/gke-cluster?ref=main"

  # Module Input Variables
  cluster_name        = "dev-gke-cluster"
  location            = "us-central1-a"
  deletion_protection = false
}

# 2. Configure Helm Provider using outputs from the remote GKE module
provider "helm" {
  kubernetes {
    host                   = "https://${module.gke.endpoint}"
    token                  = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  }
}

# 3. Deploy Tekton via Helm in the new repository
resource "helm_release" "tekton_pipeline" {
  name             = "tekton-pipeline"
  repository       = "https://cdfoundation.github.io/tekton-helm-chart/"
  chart            = "tekton-pipeline"
  namespace        = "tekton-pipelines"
  create_namespace = true
}