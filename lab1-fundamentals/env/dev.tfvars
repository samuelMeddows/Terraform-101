environment_name = "dev"
instance_count = 7
enabled = false
regions = ["us-east-1", "us-west-2"]
region_instant_count = {
  "us-east-1" = 4
  "us-west-2" = 8
}   
region_set = ["us-east-1", "us-west-2"]
sku_settings = {
  kind = "p"
  tier = "Business"
}