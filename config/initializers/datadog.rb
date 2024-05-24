# require 'datadog/statsd'
require 'ddtrace'

Datadog.configure do |c|
  c.tracing.enabled = true
  c.runtime_metrics.enabled = true
  # c.runtime_metrics.statsd = Datadog::Statsd.new('localhost', 8125)
  c.service = 'sample-api'
  c.env = ENV['development']
  c.tracing.instrument :rails, service_name: "#{c.service}"
  c.tracing.instrument :rack, quantize: { query: { show: :all } }
  c.profiling.enabled = true
end
