module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.26.6"
  cluster_name = "pri-cluster"
  cluster_version = "1.29"

  vpc_id = var.eks-vpc-id

  subnet_ids = [
    var.pri-sub1-id,
    var.pri-sub2-id
  ]

  eks_managed_node_groups = {
    pri-cluster-nodegroups = {
        min_size = 1
        max_size = 4
        desired_size = 1
        instance_types = ["t3.micro"]
    }
  }
  cluster_endpoint_private_access = true
}
