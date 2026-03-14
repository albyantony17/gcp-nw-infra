output "vpc1_network"       { value = module.vpcs["vpc-1"].vpc_id}
output "vpc2_network"       { value = module.vpcs["vpc-2"].vpc_id}
output "external_lb_ip"     { value = module.external_lb.lb_ip}