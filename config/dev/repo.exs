import Config

config :my_website, MyWebsite.Repo,
  username: "postgres",
  password: "postgres",
  database: "my_website_dev",
  hostname: "postgres",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10
