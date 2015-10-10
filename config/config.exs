# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :grbio, Grbio.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "v5jLrbaYpA+PeDBViLOWjxKADJvqN7Tyaqvh8aZinkJ0YbJb9Xw34nP/5U2F9Txg",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Grbio.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

# Configure Joken - whatever it is
config :joken, config_module: Guardian.JWT

# Configure Guardian - authentication library
config :guardian, Guardian,
      issuer: "PhoenixGuardian",
      ttl: { 10, :days },
      verify_issuer: true,
      secret_key: "lksdjowiurowieurlkjsdlwwer",
      serializer: PhoenixGuardian.GuardianSerialize
