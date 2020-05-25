# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :icd10cm,
  ecto_repos: [Icd10cm.Repo]

# Configures the endpoint
config :icd10cm, Icd10cmWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "osm9huOl9x/nWxuPvnPgFyfRBw6YgcWmn+HvfdkLT2uvBbsSKwLCl8yH7uob+0ll",
  render_errors: [view: Icd10cmWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Icd10cm.PubSub,
  live_view: [signing_salt: "18LB3Ivm"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :scrivener_html,
  routes_helper: Icd10cm.Router.Helpers
  #view_style: :bulma


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
