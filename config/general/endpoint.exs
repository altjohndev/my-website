import Config

config :my_website, MyWebsiteWeb.Endpoint,
  live_view: [signing_salt: "kvcifncJ"],
  pubsub: [name: MyWebsite.PubSub, adapter: Phoenix.PubSub.PG2],
  render_errors: [view: MyWebsiteWeb.ErrorView, accepts: ~w(html)],
  secret_key_base: "9er35yNTN2DGFd9TsPFzbweLcYtaI2EO2sEtac5bU7VMyCaFic8LoDSi3VXXqDo4",
  url: [host: "localhost"]
