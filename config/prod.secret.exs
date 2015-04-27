use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :inch_ci_gossip, InchCIGossip.Endpoint,
  secret_key_base: "Zhbc9+4V7eIyM6IfDXu2cuUqHMYNBBNnyKEuPnWZVVMIWHe/dhh6aa9pc7RbS2sR"

# Configure your database
config :inch_ci_gossip, InchCIGossip.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "inch_ci_gossip_prod"
