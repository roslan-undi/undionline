# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :undionline, ecto_repos: [Undionline.Repo], generators: [binary_id: true]

# Configures the endpoint
config :undionline, UndionlineWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "gezCztOVJKD3K7/pRxOCsVz2/26KpvIXP6iwcLAtR6kikK55jKMTPDbjxLrheGDc",
  render_errors: [view: UndionlineWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Undionline.PubSub,
  live_view: [signing_salt: "ywIHqVZp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :undionline, Undionline.Guardian,
  issuer: "undionline",
  secret_key: "Sazi8M/Isc59dcUL2V9cIyRQJXSa8pKvZ5zQM6hwdF4cFg/FyYwlNIulpUdgzN+fyTU=",
  ttl: {3, :days}

config :undionline, UndionlineWeb.AuthAccessPipeline,
  module: Undionline.Guardian,
  error_handler: UndionlineWeb.AuthErrorHandler

config :waffle,
  storage: Waffle.Storage.S3, # or Waffle.Storage.Local
  bucket: System.get_env("AWS_BUCKET_NAME") # if using S3

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

config :undionline, Undionline.Mailer,
  adapter: Bamboo.MandrillAdapter,
  api_key: "my_api_key"

config :kaffy,
   otp_app: :undionline,
   ecto_repo: Undionline.Repo,
   router: UndionlineWeb.Router

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
