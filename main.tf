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

  fill_option          = "static"
  fill_value           = 0

  aggregation_window             = 30
  expiration_duration            = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 60
  open_violation_on_expiration   = false
  close_violations_on_expiration = true

  nrql {
    query             = "SELECT average(duration) from Transaction where api='amazonaws.com' "
  }

  critical {
    operator              = "above"
    threshold             = 0.6
    threshold_duration    = 60
    threshold_occurrences = "at_least_once"
  }

  warning {
    operator              = "above"
    threshold             = 0.45
    threshold_duration    = 60
    threshold_occurrences = "at_least_once"
  }

}
