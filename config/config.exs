# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rocketnutri,
  ecto_repos: [Rocketnutri.Repo]

# Configures the endpoint
config :rocketnutri, RocketnutriWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "w7grPwnqvJrolRke27+SqXhfq9Na1calHzBFcBuTVrmkhxI++OikKDCPz/7gHhNU",
  render_errors: [view: RocketnutriWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rocketnutri.PubSub,
  live_view: [signing_salt: "6q0DIoie"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
