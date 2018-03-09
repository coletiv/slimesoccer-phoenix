defmodule SuperSlimeGameWeb.GameChannel do
  use SuperSlimeGameWeb, :channel

  alias SuperSlimeGame.GameState
  alias SuperSlimeGame.Error

  # join to topic game:*
  def join("game:" <> code, %{"email" => email}, socket) do
    case Map.has_key?(GameState.games(), code) do
      true ->
        socket = assign(socket, :player, 2)

        game =
          code
          |> GameState.get_game()
          |> Map.put(:player2, %{:email => email, :score => 0})
          |> GameState.update_game()

        socket = assign(socket, :game, game)
        {:ok, game, socket}

      false ->
        socket = assign(socket, :player, 1)

        game =
          GameState.create_game(code)
          |> Map.put(:player1, %{:email => email, :score => 0})
          |> GameState.update_game()

        socket = assign(socket, :game, game)
        {:ok, game, socket}
    end
  end

  # topic not found
  def join(_topic, _payload, _socket) do
    {:error, Error.get(:resource_not_found)}
  end

  def handle_in("playerAction", payload, socket) do
    broadcast!(socket, "playerAction", Map.put(payload, :from_player, socket.assigns.player))
    {:noreply, socket}
  end
end
