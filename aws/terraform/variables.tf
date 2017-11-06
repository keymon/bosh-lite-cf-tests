variable "env" {
  description = "Environment name"
  default = "bosh-lite-1"
}

variable "region" {
  default = "eu-west-1"
}

variable "aws_account_id" {
    description = "Root account id"
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "zone_count" {
  description = "Number of zones to use"
  default     = 3
}

variable "zones" {
  description = "AWS availability zones"

  default = {
    zone0 = "eu-west-1a"
    zone1 = "eu-west-1b"
    zone2 = "eu-west-1c"
  }
}

variable "infra_cidrs" {
  description = "CIDR for bosh_lite subnet indexed by AZ"

  default = {
    zone0 = "10.0.0.0/24"
    zone1 = "10.0.1.0/24"
    zone2 = "10.0.2.0/24"
  }
}

variable "infra_gws" {
  description = "GW per CIDR"

  default = {
    "10.0.0.0/24" = "10.0.0.1"
    "10.0.1.0/24" = "10.0.1.1"
    "10.0.2.0/24" = "10.0.2.1"
  }
}

variable "bosh_lite_private_ip" {
  description = "Bosh lite internal IP"
  default     = "10.0.0.6"
}

variable "assets_prefix" {
  description = "Prefix for global assests like S3 buckets"
  default     = "keytwine"
}

variable "admin_cidrs" {
  description = "CSV of CIDR addresses with access to operator/admin endpoints"
  type        = "list"
}
