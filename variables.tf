variable "project_id" {}
variable "region" {}
variable "zone"{}

variable "vpcs" {
  type = map(object({
    subnets = list(object({
      name      = string
      cidr      = string
      region    = string  
    }))
  }))
}

variable "vpc_peering" {
  type = object({ vpc_a = string, vpc_b = string })
}