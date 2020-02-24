defmodule MyWebsiteWeb.UnderConstructionLive do
  @moduledoc false

  use Phoenix.LiveView

  alias Phoenix.LiveView.{Rendered, Socket}

  alias MyWebsiteWeb.UnderConstructionView

  @hex_alphabet ~w(0 1 2 3 4 5 6 7 8 9 a b c d e f)
  @light_hex_alphabet ~w(9 a b c d e)
  @dark_hex_alphabet ~w(2 3 4 5 6 7)

  @default_values [
    a_color: "ff6600",
    background_color: "24292e",
    circle_color: "ffffff",
    j_color: "024866",
    message: "This page is under development",
    message_color: "ffffff"
  ]

  @message ~w(this page is under development)

  @spec mount(any, map, Socket.t()) :: {:ok, Socket.t()}
  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(11_000, self(), :update_background_and_message)
      :timer.send_interval(15_000, self(), :update_circle_and_logo)
    end

    {:ok, assign(socket, @default_values)}
  end

  @spec render(Socket.t()) :: Rendered.t()
  def render(assigns), do: UnderConstructionView.render("index.html", assigns)

  @spec handle_info(atom, Socket.t()) :: {:noreply, Socket.t()}
  def handle_info(:update_background_and_message, socket) do
    {
      :noreply,
      assign(
        socket,
        background_color: get_color(:dark),
        message: get_message(),
        message_color: get_color(:light)
      )
    }
  end

  def handle_info(:update_circle_and_logo, socket) do
    {
      :noreply,
      assign(
        socket,
        a_color: get_color(:dark),
        circle_color: get_color(:light),
        j_color: get_color(:dark)
      )
    }
  end

  defp get_color(type) do
    alphabet = if type == :light, do: @light_hex_alphabet, else: @dark_hex_alphabet

    Enum.random(alphabet) <>
      Enum.random(@hex_alphabet) <>
      Enum.random(alphabet) <>
      Enum.random(@hex_alphabet) <>
      Enum.random(alphabet) <>
      Enum.random(@hex_alphabet)
  end

  defp get_message, do: @message |> Enum.shuffle() |> Enum.join(" ") |> String.capitalize()
end
