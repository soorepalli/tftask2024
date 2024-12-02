variable "credentials_file" {
  description = "Path to the GCP credentials file"
  type        = string
  //default     = "./nichecloudexpert-1bbb33e34e42.json"
}

variable "project_id" {
  description = "The GCP project ID"
  type        = string
  default     = "nichecloudexpert"
}

variable "region" {
  description = "The GCP region for the resources"
  type        = string
  default     = "us-central1"
}


variable "bucket_prefix" {
  description = "Prefix for bucket names"
  type        = string
}

variable "location" {
  description = "Location of the buckets"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "Storage class for the buckets"
  type        = string
  default     = "STANDARD"
}

variable "labels" {
  description = "Labels to apply to the buckets"
  type        = map(string)
  default     = {}
}

variable "versioning" {
  description = "Enable versioning for the buckets"
  type        = bool
  default     = false
}

variable "uniform_bucket_level_access" {
  description = "Enable uniform bucket-level access"
  type        = bool
  default     = true
}

variable "bucket_count" {
  description = "Number of buckets to create"
  type        = number
  default     = 1
}
