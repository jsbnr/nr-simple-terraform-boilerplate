terraform {
  required_version = "~> 1.3.4"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.6.1"
    }
  }
}

provider "newrelic" {
  region = "US" 
}