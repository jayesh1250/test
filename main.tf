module "vpc"{
    source = "./modules/vpc"
    vpc_name = var.vpc_name
    vpc_azs = var.vpc_azs
    vpc_cidr = var.vpc_cidr
    vpc_private_subnets = var.vpc_private_subnets
    vpc_public_subnets = var.vpc_public_subnets
}

module "ec2" {
    source = "./modules/ec2"
}

module "s3"{
    source = "./modules/s3"
}

module "eks" {
    source = "./modules/eks"
    vpc_id = module.vpc.vpc_id
    private_subnets = module.vpc.private_subnets_id
}
