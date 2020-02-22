import Config

config :logger,
  backends: [:console],
  discard_threshold: 5_000,
  level: :debug,
  truncate: :infinity

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [
    :error_metadata,
    :error_stacktrace,
    :request_id
  ]
