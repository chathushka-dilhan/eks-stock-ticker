// This is the root module that brings all other modules together.

module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  vpc_cidr_block       = var.vpc_cidr_block
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}

module "iam" {
  source = "./modules/iam"

  cluster_name = var.cluster_name
  tags         = var.tags
}

module "eks" {
  source = "./modules/eks"

  cluster_name                   = var.cluster_name
  kubernetes_version             = var.kubernetes_version
  eks_cluster_role_arn           = module.iam.eks_cluster_role_arn
  fargate_pod_execution_role_arn = module.iam.fargate_pod_execution_role_arn
  public_subnet_ids              = module.vpc.public_subnet_ids
  private_subnet_ids             = module.vpc.private_subnet_ids
  tags                           = var.tags

  # This explicit dependency ensures that the IAM role policies are attached
  # before the EKS cluster is created.
  depends_on = [module.iam]
}

module "msk" {
  source = "./modules/msk"

  cluster_name           = "${var.project_name}-msk-cluster"
  kafka_version          = var.kafka_version
  number_of_broker_nodes = var.number_of_broker_nodes
  broker_instance_type   = var.broker_instance_type
  vpc_id                 = module.vpc.vpc_id
  vpc_cidr_block         = module.vpc.vpc_cidr_block
  private_subnet_ids     = module.vpc.private_subnet_ids
  tags                   = var.tags

  depends_on = [module.vpc]
}

module "ecr" {
  source = "./modules/ecr"

  repository_names = var.ecr_repository_names
  tags             = var.tags
}

module "api_gateway" {
  source = "./modules/api_gateway"

  project_name = var.project_name
  tags         = var.tags
}