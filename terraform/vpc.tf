module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  version = "~> 6.0"
  name    = "kubernetes-project-vpc"
  cidr    = "10.0.0.0/16"

  azs                          = ["us-east-1a", "us-east-1b"]
  private_subnets              = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets               = ["10.0.101.0/24", "10.0.102.0/24"]
  database_subnets             = ["10.0.21.0/24", "10.0.22.0/24"]
  create_database_subnet_group = true

  # NAT Gateway
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPN not required
  enable_vpn_gateway = false

  # DNS
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
  }
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = 1
  }
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Project     = "kubernetes-project"
  }
}
