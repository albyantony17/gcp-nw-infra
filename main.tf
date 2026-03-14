module "vpcs" {
  source    = "./modules/vpc"
  foreach   = var.vpcs
  vpc_name  = each.key
  subnets   = each.value.subnets 
}