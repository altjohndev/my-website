import Config

get = fn env, type, default ->
  value = System.get_env(env)

  case {value, type} do
    {nil, _type} -> default
    {value, :atom} -> String.to_atom(value)
    {value, :boolean} -> String.to_existing_atom(value)
    {value, :integer} -> String.to_integer(value)
    {value, :string} -> value
  end
end

get_or_raise! = fn env, type ->
  get.(env, type, nil) || raise "environment variable #{env} is missing"
end

#
# Logger
#

discard_threshold = get.("LOGGER_DISCARD_THRESHOLD", :integer, 5_000)
level = get.("LOGGER_LEVEL", :atom, :info)

truncate = get.("LOGGER_TRUNCATE", :string, "infinity")
truncate = if truncate == "infinity", do: :infinity, else: String.to_integer(truncate)

config :logger,
  backends: [:console],
  discard_threshold: discard_threshold,
  level: level,
  truncate: truncate

base_format = "__date __time [__level__levelpad] __message __metadata\n"
format = get.("LOGGER_FORMAT", :string, base_format) |> String.replace("__", "$")

metadata =
  "LOGGER_METADATA"
  |> get.(:string, "request_id")
  |> String.split(",")
  |> Enum.map(fn meta -> String.to_atom(meta) end)

config :logger, :console,
  format: format,
  metadata: metadata

#
# My Website
#

# Endpoint

hostname = get_or_raise!.("APP_HOSTNAME", :string)
port = get.("APP_PORT", :integer, 80)
secret_key_base = get_or_raise!.("APP_SECRET_KEY_BASE", :string)

origin_hostnames =
  "APP_ORIGIN_HOSTNAMES"
  |> get_or_raise!.(:string, "localhost")
  |> String.split(",")
  |> Enum.map(fn hostname -> ["http://#{hostname}:#{port}", "https://#{hostname}:#{port}"] end)
  |> List.flatten()

config :my_website, MyWebsiteWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  check_origin: origin_hostnames,
  http: [port: port],
  secret_key_base: secret_key_base,
  url: [host: hostname, port: port]

# Repo

database = get.("APP_DATABASE_NAME", :string, "my_website")
hostname = get.("APP_DATABASE_HOSTNAME", :string, "postgres")
ssl? = get.("APP_DATABASE_SSL", :boolean, false)
password = get.("APP_DATABASE_PASSWORD", :string, "postgres")
pool_size = get.("APP_DATABASE_POOL_SIZE", :integer, 10)
username = get.("APP_DATABASE_USERNAME", :string, "postgres")

config :my_website, MyWebsite.Repo,
  database: database,
  hostname: hostname,
  ssl: ssl?,
  password: password,
  pool_size: pool_size,
  username: username
