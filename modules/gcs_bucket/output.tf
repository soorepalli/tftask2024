output "bucket_names" {
  description = "Names of the created buckets"
  value       = [for bucket in google_storage_bucket.bucket : bucket.name]
}
