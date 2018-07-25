# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gostop,
  ecto_repos: [Gostop.Repo]

# Configures the endpoint
config :gostop, GostopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W63ekSqEwLNFub4TtJqDE8PXqTZYOjovnSXE0BSQ1S1FUoXJvcAWMO8R6EgIyD8E",
  render_errors: [view: GostopWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gostop.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :gostop, Gostop.Auth.Guardian,
  issuer: "gostop",
  secret_key: "lY5zqXmf6nRKOM/LaBnw/oNskvpFuhhd0rz+Oq+P5LymPMT+uvETemU2B64PRuSc"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
