# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :push_server,
  ecto_repos: [PushServer.Repo]

# Configures the endpoint
config :push_server, PushServer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "MaeTsJW6LnyRHsrk2FUELjUvg06wjq67e7hCOWfYjQxa/tMcQENT6sTeWkMpnSEP",
  render_errors: [view: PushServer.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PushServer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
