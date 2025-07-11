module "vpc" {
  source = "./modules/vpc"
  region = var.region
}

module "eks" {
  source       = "./modules/eks"
  cluster_name = var.cluster_name
  subnet_ids   = module.vpc.public_subnets
  vpc_id       = module.vpc.vpc_id
}

resource "helm_release" "gradyent_app" {
  name       = "gradyent-app"
  chart      = "./helm-chart"
  namespace  = "default"
  values     = [file("./helm-chart/values.yaml")]
  depends_on = [module.eks]
}
