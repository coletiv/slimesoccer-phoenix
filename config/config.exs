# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :slimesoccer,
  ecto_repos: [Slimesoccer.Repo]

# Configures the endpoint
config :slimesoccer, Slimesoccer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "diEbndpac1oXttbGscv6Ta+dksE01h7tWwANzUopLzhNP6Movbb6uypx4V4g/TUA",
  render_errors: [view: Slimesoccer.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Slimesoccer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
