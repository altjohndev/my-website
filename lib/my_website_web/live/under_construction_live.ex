defmodule MyWebsiteWeb.UnderConstructionLive do
  @moduledoc false

  use Phoenix.LiveView

  alias Phoenix.LiveView.{Rendered, Socket}

  alias MyWebsiteWeb.UnderConstructionView

  @spec mount(any, map, Socket.t()) :: {:ok, Socket.t()}
  def mount(_params, _session, socket) do
    if connected?(socket), do: :timer.send_interval(5_000, self(), :update_color_id)
    {:ok, assign(socket, color_id: 0)}
  end

  @spec render(Socket.t()) :: Rendered.t()
  def render(assigns), do: UnderConstructionView.render("index.html", assigns)

  @spec handle_info(atom, Socket.t()) :: {:noreply, Socket.t()}
  def handle_info(:update_color_id, socket) do
    {:noreply, update(socket, :color_id, &update_color_id/1)}
  end

  defp update_color_id(color_id) do
    if color_id > 9 do
      0
    else
      color_id + 1
    end
  end
end
