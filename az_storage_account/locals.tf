locals {
  regions = lookup(var.region_abbreviations, var.location, false)
}