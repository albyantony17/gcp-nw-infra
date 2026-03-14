project_id = "deft-apparatus-490107-c8"
region     = "us-central1"
zone       = "us-central1-a"

vpcs = {
  vpc-1 = {
    subnets = [{ name = "vpc1-subnet", cidr = "10.0.1.0/24", region = "us-central1" }]
  }
  vpc-2 = {
    subnets = [{ name = "vpc2-subnet", cidr = "10.1.1.0/24", region = "us-central1" }]
  }
  onprem-network = {
    subnets = [{ name = "onprem-subnet", cidr = "10.2.1.0/24", region = "us-central1" }]
  }
}