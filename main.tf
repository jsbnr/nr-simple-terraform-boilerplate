# terraform config 
terraform {
  required_version = "~> 1.1.3"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 2.35.0"
    }
  }
}

provider "newrelic" {
  region = "US" 
}


variable "accountId" { type = string }


# Alert example

resource "newrelic_alert_policy" "policy" {
  name = "Example terraform alert policy"
  incident_preference = "PER_POLICY" 
}

resource "newrelic_nrql_alert_condition" "nrql_condition" {
  account_id                   = var.accountId
  policy_id                    = newrelic_alert_policy.policy.id
  type                         = "static"
  name                         = "Example NRQL Condition"
  enabled                      = true
  violation_time_limit_seconds = 3600
  value_function               = "single_value"

  fill_option          = "static"
  fill_value           = 0

  aggregation_window             = 30
  expiration_duration            = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 60
  open_violation_on_expiration   = false
  close_violations_on_expiration = true

  nrql {
    query             = "select count(*) from Transaction where error is true"
  }

  critical {
    operator              = "above"
    threshold             = 5
    threshold_duration    = 60
    threshold_occurrences = "at_least_once"
  }

  warning {
    operator              = "above"
    threshold             = 2
    threshold_duration    = 60
    threshold_occurrences = "at_least_once"
  }

}
