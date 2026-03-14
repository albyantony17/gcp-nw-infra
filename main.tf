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

module "cloud_nat" {
  source    ="./modules/cloud_nat"
  router_name = var.cloud_nat.router_name
  nat_name    = var.cloud_nat.nat_name
  network     = module.vpcs[var.cloud_nat.vpc].vpc_id
  region      = var.region
}

module "vpn" {
  source        = "./modules/cloud_vpn"
  vpc           = var.vpcs
  gateway_name  = var.vpn.gateway_name
  network       = module.vpcs[var.vpn.vpc].vpc_id
  region        = var.region
  peer_ip       = var.vpn.peer_ip
  shared_secret = var.vpn.shared_secret
  tunnel_name   = var.vpn.tunnel_name
  local_cidr    = var.vpn.local_cidr
  remote_cidr   = var.vpn.remote_cidr
}

module "external_lb" {
  source    = "./modules/external_lb"
  network   = module.vpcs[var.external_lb.vpc].vpc_id
  zone      = var.zone
}

module "internal_lb" {
  source    = "./modules/internal_lb"
  network   = module.vpcs[var.internal_lb.vpc].vpc_id
  subnet    = var.internal_lb.subnet
  region    = var.region
  zone      = var.zone
}

module "custom_route" {
  source          ="./modules/routes"
  router_name             = "vm-router-route"
  network                 = module.vpcs["vpc-1"].vpc_id
  dest_range              = "0.0.0.0/0"
  next_hop_instance       = module.vm["vm1"].name
  next_hop_instance_zone  = module.vm["vm1"].zone
  priority                = 900
}

module "dns" {
  source = "./modules/dns"
  domain_name    = var.dns.public_domain
  private_domain = var.dns.private_domain
  lb_ip          = module.external_lb.lb_ip
  network        = module.vpcs["var.dns.vpc"].vpc_id
}