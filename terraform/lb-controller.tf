module "lb_controller_pod_identity" {
  source  = "terraform-aws-modules/eks-pod-identity/aws"
  version = "~> 2.0"

  name                            = "aws-lb-controller"
  attach_aws_lb_controller_policy = true

  associations = {
    this = {
      cluster_name    = module.eks.cluster_name
      namespace       = "kube-system"
      service_account = "aws-load-balancer-controller"
    }
  }
}

resource "helm_release" "aws_lb_controller" {
  name       = "aws-load-balancer-controller"
  repository = "https://aws.github.io/eks-charts"
  chart      = "aws-load-balancer-controller"
  namespace  = "kube-system"

  set = [
    { name = "clusterName", value = module.eks.cluster_name },
    { name = "vpcId", value = module.vpc.vpc_id },
    { name = "region", value = "us-east-1" },
    { name = "serviceAccount.name", value = "aws-load-balancer-controller" },
    { name = "enableServiceMutatorWebhook", value = "false" },
  ]

  depends_on = [
    module.eks, # nodes + coredns etc. must exist first
    module.lb_controller_pod_identity,
  ]
}
