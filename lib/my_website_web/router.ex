defmodule MyWebsiteWeb.Router do
  use MyWebsiteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", MyWebsiteWeb do
    pipe_through :browser

    live "/", UnderConstructionLive
  end
end
