module "vpc" {
  source   = "./modules/vpc"
  name     = "${var.name}"
  env      = "${var.env}"
  vpc_cidr = "${var.vpc_cidr}"

  tags {
    Infra             = "${var.name}"
    Environment       = "${var.env}"
    Terraformed       = "true"
    KubernetesCluster = "${var.env}.${var.name}"
  }
}

module "subnet_pair" {
  source              = "./modules/subnet-pair"
  name                = "${var.name}"
  env                 = "${var.env}"
  vpc_id              = "${module.vpc.vpc_id}"
  vpc_cidr            = "${module.vpc.cidr_block}"
  internet_gateway_id = "${module.vpc.internet_gateway_id}"
  availability_zones  = "${var.azs}"

  tags {
    Infra             = "${var.name}"
    Environment       = "${var.env}"
    Terraformed       = "true"
    KubernetesCluster = "${var.env}.${var.name}"
  }
}

module "hosted_zone" {
  source   = "./modules/route-53"
  name     = "${var.name}"
  env      = "${var.env}"

  tags {
    Infra             = "${var.name}"
    Environment       = "${var.env}"
    Terraformed       = "true"
    KubernetesCluster = "${var.env}.${var.name}"
  }
}

module "remote_state" {
  source   = "./modules/s3-bucket"
  name     = "${var.name}"
  env      = "${var.env}"

  tags {
    Infra             = "${var.name}"
    Environment       = "${var.env}"
    Terraformed       = "true"
    KubernetesCluster = "${var.env}.${var.name}"
  }
}
