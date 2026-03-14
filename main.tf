module "vpcs" {
  source   = "./modules/vpc"
  for_each = var.vpcs

  vpc_name = each.key
  subnets  = each.value.subnets
}

module "vpc_peering" {
  source = "./modules/vpc_peering"
  vpc_a  = module.vpcs[var.vpc_peering.vpc_a].vpc_self_link
  vpc_b  = module.vpcs[var.vpc_peering.vpc_b].vpc_self_link
}

module "vm" {
  source = "./modules/vm"
  for_each = var.vms

  name      = each.key
  machine_type = var.machine_type
  zone         = each.value.zone
  subnet       = each.value.subnet
  tags         = each.value.tags
  image        = var.image
}