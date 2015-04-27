use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :inch_ci_gossip, InchCIGossip.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :inch_ci_gossip, InchCIGossip.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "inch_ci_gossip_test",
  size: 1,
  max_overflow: false
