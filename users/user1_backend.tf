terraform {
  backend "gcs" {
    bucket  = "terraform-state-bucket-user1"
    prefix  = "terraform/state/user1"
    project = "your-gcp-project-id"
  }
}
