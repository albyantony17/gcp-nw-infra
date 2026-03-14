variable "project_id" {}
variable "region" {}
variable "zone"{}
########  vpcs  ##############
variable "vpcs" {
  type = map(object({
    subnets = list(object({
      name      = string
      cidr      = string
      region    = string  
    }))
  }))
}
#########  vpc_peering  ##############
variable "vpc_peering" {
  type = object({ vpc_a = string, vpc_b = string })
}
#########  VM'S   ##############
variable "vms" {
  description = "vm configuration"
  type = map(object({
    zone   = string
    subnet = string
    tags   = list(string)
  }))
}
variable "machine_type" {
  type = string
}
variable "image" {
  type = string
}

variable "cloud_nat" {
  type = object({ router_name = string, nat_name = string, vpc = string})
}