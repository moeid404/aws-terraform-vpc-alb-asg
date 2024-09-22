module "vpc" {
  source = "./modules/01-vpc-igw"
}

module "subnets" {
  source = "./modules/02-subnets"
  vpc_id = module.vpc.vpc_id
}

module "natgw" {
  source = "./modules/03-natgw-eip"
  public_subnet_a_id = module.subnets.public_subnet_a_id
  public_subnet_b_id = module.subnets.public_subnet_b_id
}

module "route_tables" {
  source = "./modules/04-route_tables"
  vpc_id                  = module.vpc.vpc_id
  internet_gateway_id     = module.vpc.internet_gateway_id
  nat_gateway_a_id        = module.natgw.nat_gateway_a_id
  nat_gateway_b_id        = module.natgw.nat_gateway_b_id
  public_subnet_a_id      = module.subnets.public_subnet_a_id
  public_subnet_b_id      = module.subnets.public_subnet_b_id
  private_subnet_a_id     = module.subnets.private_subnet_a_id
  private_subnet_b_id     = module.subnets.private_subnet_b_id
}

module "security_groups" {
  source = "./modules/05-security_groups"
  vpc_id = module.vpc.vpc_id
}

module "instances-bastion" {
  source = "./modules/06-instances-Bastion"

  public_subnet_a_id  = module.subnets.public_subnet_a_id
  public_subnet_b_id  = module.subnets.public_subnet_b_id
  private_subnet_a_id = module.subnets.private_subnet_a_id
  private_subnet_b_id = module.subnets.private_subnet_b_id
  public_sg_id        = module.security_groups.public_sg_id
  private_sg_id       = module.security_groups.private_sg_id
}

module "alb" {
  source = "./modules/07-ALB"
  public_sg_id           = module.security_groups.public_sg_id
  public_subnet_a_id     = module.subnets.public_subnet_a_id 
  public_subnet_b_id     = module.subnets.public_subnet_b_id 
  vpc_id                 = module.vpc.vpc_id
}

module "autoscaling" {
  source = "./modules/08-auto_scaling_group"
  key_pair_name   = module.instances-bastion.key_pair_name
  public_sg_id    = module.security_groups.public_sg_id
  private_subnet_a_id = module.subnets.private_subnet_a_id
  private_subnet_b_id = module.subnets.private_subnet_b_id
  target_group_arn      = module.alb.target_group_arn
}

