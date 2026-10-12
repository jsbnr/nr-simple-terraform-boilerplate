terraform {
  required_version = "~> 1.16.5"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.100.4"
    }
  }
}

provider "newrelic" {
  region = "US" 
}