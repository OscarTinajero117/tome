import Config

config :tome,
  ecto_repos: [Tome.Repo]

import_config "#{config_env()}.exs"
