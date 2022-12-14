# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :signal_server,
  ecto_repos: [SignalServer.Repo]

# Configures the endpoint
config :signal_server, SignalServerWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: SignalServerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: SignalServer.PubSub,
  live_view: [signing_salt: "DbD9nBp8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :mongooseice, secret: "papierz"
config :mongooseice, :servers, udp: [ip: {0, 0, 0, 0}, port: 2137]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
