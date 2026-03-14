variale "vpc_name" {}
variable "subnets" {
  type = list(object({ name=string, cidr=string, region=string }))
  }  