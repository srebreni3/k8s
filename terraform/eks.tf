module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "kubernetes-project"
  kubernetes_version = "1.37"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  endpoint_public_access                   = true # so you can run kubectl from your laptop
  enable_cluster_creator_admin_permissions = true # gives your IAM user cluster-admin

  addons = {
    coredns                = {}
    kube-proxy             = {}
    vpc-cni                = { before_compute = true }
    eks-pod-identity-agent = { before_compute = true }
  }

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2
    }
  }

  upgrade_policy = {
    support_type = "STANDARD"
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "kubernetes-project"
  }
}