module "eks" {
  source  = "./terraform-aws-eks"
  #version = "~> 18.0"

  cluster_name    = "my-cluster"
  cluster_version = "1.22"

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }

#   cluster_encryption_config = [{
#     provider_key_arn = "arn:aws:kms:eu-west-1:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"
#     resources        = ["secrets"]
#   }]

  vpc_id     = "vpc-0da575db52ad5de47"
  subnet_ids = ["subnet-0a3f03cf29af471cb"]

#   # Self Managed Node Group(s)
#   self_managed_node_group_defaults = {
#     instance_type                          = "m6i.large"
#     update_launch_template_default_version = true
#     iam_role_additional_policies = [
#       "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
#     ]
#   }

#   self_managed_node_groups = {
#     one = {
#       name         = "mixed-1"
#       max_size     = 5
#       desired_size = 2

#       use_mixed_instances_policy = true
#       mixed_instances_policy = {
#         instances_distribution = {
#           on_demand_base_capacity                  = 0
#           on_demand_percentage_above_base_capacity = 10
#           spot_allocation_strategy                 = "capacity-optimized"
#         }

#         override = [
#           {
#             instance_type     = "m5.large"
#             weighted_capacity = "1"
#           },
#           {
#             instance_type     = "m6i.large"
#             weighted_capacity = "2"
#           },
#         ]
#       }
#     }
#   }

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    disk_size      = var.disk_size
    instance_types = ["t2.micro"]
    kubelet_extra_args            = "--node-labels=my_node_label --register-with-taints=my_node_label:NoSchedule"
  }

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

#   aws_eks_node_group" "test" {
#   cluster_name    = var.cluster_name
#   node_group_name = "test"
#   disk_size       = 20
#   taint {
#     key = "dedicated"
#     value = "gpuGroup"
#     effect = "NO_SCHEDULE"
#   }
#   scaling_config {
#       desired_size = 1
#       max_size     = 3
#       min_size     = 1
#   }
#   labels = {
#         "some-labels" = "labels"
#   }
#   instance_types = ["t3.micro"]
# }

#   # Fargate Profile(s)
#   fargate_profiles = {
#     default = {
#       name = "default"
#       selectors = [
#         {
#           namespace = "default"
#         }
#       ]
#     }
#   }

  # aws-auth configmap
#   manage_aws_auth_configmap = true

#   aws_auth_roles = [
#     {
#       rolearn  = "arn:aws:iam::66666666666:role/role1"
#       username = "role1"
#       groups   = ["system:masters"]
#     },
#   ]

#   aws_auth_users = [
#     {
#       userarn  = "arn:aws:iam::66666666666:user/user1"
#       username = "user1"
#       groups   = ["system:masters"]
#     },
#     {
#       userarn  = "arn:aws:iam::66666666666:user/user2"
#       username = "user2"
#       groups   = ["system:masters"]
#     },
#   ]

#   aws_auth_accounts = [
#     "777777777777",
#     "888888888888",
# ]

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}


module "bucket" {
  source = "./bucket"
  bucket = var.bucket
}