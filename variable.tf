####### EKS #######

variable "disk_size"{
    description = "The AWS region where Redis will be deployed"
    default = 50
}


######Instance########

variable "region"{
    description = "The AWS region where Redis will be deployed"
    default = "ap-south-1"
}
variable "ami"{
    description = "ami value for the instance creation"
    default = "ami-08df646e18b182346"
}

variable "instance_type"{
    description = "provide the instance type"
    default = "t2.micro"
}

variable "cidr_block"{
    description = "provide the instance type"
    default = "10.1.0.0/16"
}

##### Bucket #####

variable "bucket"{
    description = "bucket name"
    default = "anshuman-june-bucket"
}

variable "acl"{
    description = "ACL declaration"
    default = "private"
}

#### PGSQL ####

variable "length"{
    description = "length of password"
    default = 20
}

variable "special"{
    description = " special value"
    default = false
}
variable "override_special"{
    description = "provide the override_special value"
    default = "_%@"
}

variable "allocated_storage"{
    description = "provide the override_special value"
    default = 20
}

variable "engine"{
    description = "provide the override_special value"
    default = "postgres"
}

variable "identifier"{
    description = "provide the override_special value"
    default = "bankpoc"
}

variable "engine_version"{
    description = "provide the override_special value"
    default = 14.1
}

variable "instance_class"{
    description = "provide the override_special value"
    default = "db.t2.micro"
}

variable "name"{
    description = "provide the override_special value"
    default = "ntweeklydb001"
}

variable "username"{
    description = "provide the override_special value"
    default = "dbadmin1"
}

variable "skip_final_snapshot"{
    description = "provide the override_special value"
    default = true
}

variable "publicly_accessible"{
    description = "provide the override_special value"
    default = true
}


#### Redis ####

variable "cluster_id"{
    description = "The AWS region where Redis will be deployed"
    default = "cluster-bankpoc"
}

# variable "engine"{
#     description = "The AWS region where Redis will be deployed"
#     default = "redis"
# }

# variable "engine_version"{
#     description = "The AWS region where Redis will be deployed"
#     default = "3.2.10"
# }

variable "node_type"{
    description = "The AWS region where Redis will be deployed"
    default = "cache.t2.micro"
}

variable "num_cache_nodes"{
    description = "The AWS region where Redis will be deployed"
    default = 1
}

variable "parameter_group_name"{
    description = "The AWS region where Redis will be deployed"
    default = "default.redis3.2"
}

variable "port"{
    description = "The AWS region where Redis will be deployed"
    default = 6379
}



