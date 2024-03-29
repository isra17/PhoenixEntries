use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_entries, PhoenixEntries.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_entries, PhoenixEntries.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres-dev",
  database: "phoenix_entries_test",
  hostname: "192.168.99.100",
  pool: Ecto.Adapters.SQL.Sandbox
