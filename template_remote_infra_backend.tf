################################################################
# Set remote state
################################################################

data "terraform_remote_state" "terraform_basic_infra_remote_state" {
  backend = "s3"
  config {
    bucket  = "${module.remote_state.state_store}"
    profile = "symphony-aws-es1"
    key     = "infrastructure/terraform/terraform.tfstate"
    region  = "${var.region}"
  }
}