import Config

config :my_website, MyWebsite.Repo,
  username: "postgres",
  password: "postgres",
  database: "my_website_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox
