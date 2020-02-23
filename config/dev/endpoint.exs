import Config

config :my_website, MyWebsiteWeb.Endpoint,
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  http: [port: 4000],
  live_reload: [
    patterns: [
      ~r"priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/flux_device_manager_web/(live|views)/.*(ex)$",
      ~r"lib/flux_device_manager_web/templates/.*(eex|leex)$"
    ]
  ],
  watchers: [
    node: [
      "node_modules/webpack/bin/webpack.js",
      "--mode",
      "development",
      "--watch-stdin",
      cd: Path.expand("../../assets", __DIR__)
    ]
  ]
