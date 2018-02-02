defmodule SuperSlimeGameWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel("game:*", SuperSlimeGameWeb.GameChannel)

  ## Transports - long polling
  transport(:websocket, Phoenix.Transports.WebSocket)

  def connect(_params, socket) do
  {:ok, socket}
  end

  def id(_socket), do: nil
end
