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

vpc_peering = { vpc_a = "vpc-1", vpc_b = "vpc-2" }

machine_type = "e2-micro"
image = "debian-cloud/debian-12"

vms = {
  vm1 = {
    zone   = "us-central1-a"
    subnet = "subnet-1"
    tags   = ["web"]  
  }
  vm2 = {
    zone   = "us-central1-b"
    subnet = "subnet-2"
    tags   = ["app"]
  }
}  

cloud_nat = { router_name = "nat-router", nat_name = "cloud-nat", vpc = "vpc-1"}