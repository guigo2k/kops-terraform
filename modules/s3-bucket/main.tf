resource "aws_s3_bucket" "state_store" {
  bucket        = "${var.name}-state"
  acl           = "private"
  force_destroy = true

  versioning {
    enabled = true
  }

  tags {
    Name        = "${var.name}-${var.env}-state-store"
    Infra       = "${var.name}"
    Environment = "${var.env}"
    Terraformed = "true"
  }
}
