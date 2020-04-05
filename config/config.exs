# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :covid,
  ecto_repos: [Covid.Repo]

# Configures the endpoint
config :covid, CovidWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "acnWg6kyut1BE9e4LBd6gc2dF0VcMvJK2qoN8W9m9/P0oMUkhKtDLgbqvX987rM+",
  render_errors: [view: CovidWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Covid.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "WZfH7XW8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
