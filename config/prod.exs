use Mix.Config

config :phoenix_entries, PhoenixEntries.Endpoint,
  http: [port: System.get_env("PORT")],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE"),
  url: [scheme: "https", host: "phoenix-entries.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]]

# Configure your database
config :phoenix_entries, PhoenixEntries.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

# Do not print debug messages in production
config :logger, level: :info

