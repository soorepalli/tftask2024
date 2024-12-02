terraform {
  backend "gcs" {
    
    bucket  = "tftk2024"
    prefix  = "terraform/state/user1"
    #project = "nichecloudexpert"

  }
}
