/*
resource "google_storage_bucket" "bucket" {
  count          = var.bucket_count
  name           = "${var.bucket_prefix}-${count.index + 1}"
  location       = var.location
  storage_class  = var.storage_class

  labels = var.labels

  versioning {
    enabled = var.versioning
  }

  uniform_bucket_level_access = var.uniform_bucket_level_access
}
*/
resource "google_storage_bucket" "bucket" {
  //count = var.bucket_count
  for_each = tomap({for idx in range(var.bucket_count) : idx => tostring(idx) })

  # Add a unique identifier to the bucket name
  name = "${var.bucket_prefix}-${each.value + 1}-${random_id.unique_id.hex}"

  location      = var.location
  storage_class = var.storage_class

  labels = var.labels

  versioning {
    enabled = var.versioning
  }

  uniform_bucket_level_access = var.uniform_bucket_level_access
}

# Generate a unique identifier
resource "random_id" "unique_id" {
  byte_length = 4 # Generates an 8-character hexadecimal string
}
