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