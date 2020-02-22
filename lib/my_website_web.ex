defmodule MyWebsiteWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use MyWebsiteWeb, :controller
      use MyWebsiteWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  @spec channel :: {:__block__, [], any}
  def controller do
    quote do
      use Phoenix.Controller, namespace: MyWebsiteWeb

      import Phoenix.LiveView.Controller
      import Plug.Conn
      import MyWebsiteWeb.Gettext
      alias MyWebsiteWeb.Router.Helpers, as: Routes
    end
  end

  @spec channel :: {:__block__, [], any}
  def view do
    quote do
      use Phoenix.View,
        root: "lib/my_website_web/templates",
        namespace: MyWebsiteWeb

      import Phoenix.LiveView.Helpers

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_flash: 1, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import MyWebsiteWeb.ErrorHelpers
      import MyWebsiteWeb.Gettext
      alias MyWebsiteWeb.Router.Helpers, as: Routes
    end
  end

  @spec channel :: {:__block__, [], any}
  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
      import Phoenix.LiveView.Router
    end
  end

  @spec channel :: {:__block__, [], any}
  def channel do
    quote do
      use Phoenix.Channel
      import MyWebsiteWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
