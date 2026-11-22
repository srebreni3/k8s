terraform {
  required_version = ">= 1.10.0"

  backend "s3" {
    bucket       = "ahmed-srebrenica-kubernetes-project"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}