terraform {
  required_version = "~> 1.11.3"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.61.0"
    }
  }
}

provider "newrelic" {
  region = "US" 
}