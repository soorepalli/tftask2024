locals {
  user_configs = fileset("${path.module}/users", "*.tfvars")
}

module "gcs_buckets" {
  for_each = tomap({ for user_config in local.user_configs : user_config => user_config })

  source                      = "./modules/gcs_bucket"
  bucket_prefix               = var.bucket_prefix
  location                    = var.location
  storage_class               = var.storage_class
  labels                      = var.labels
  versioning                  = var.versioning
  uniform_bucket_level_access = var.uniform_bucket_level_access
  bucket_count                = var.bucket_count
}
