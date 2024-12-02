terraform {
  backend "gcs" {
    
    bucket  = "tftk22024"
    prefix  = "terraform/state/user2"
    #project = "nichecloudexpert"

  }
}
