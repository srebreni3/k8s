  What the controller creates in AWS

  - ALB cve-alb, spread over both public subnets (two AZs)
  - Listener on port 80
  - Target group containing the 2 frontend pod IPs. When pods are replaced, the controller updates it automatically.
  - Security groups: one for the ALB that allows 0.0.0.0/0 on port 80, plus a rule that lets the ALB reach the pods

  Terraform doesn't know about any of this; it's managed by the controller. Before terraform destroy, always run kubectl delete -f ingress.yaml (or delete the whole namespace) and wait about a minute. Otherwise the ALB and its security group stay behind, and Terraform gets stuck deleting the VPC.