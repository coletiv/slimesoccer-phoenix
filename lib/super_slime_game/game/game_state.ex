defmodule SuperSlimeGame.GameState do
  @moduledoc """
    This module holds the game current state. It also contains the game logic.
    Allows to add new players to the board, move them and detect collisions.
  """

  @doc """
    Used by the supervisor to start the Agent that will keep the game state persistent.
    The initial value passed to the Agent is an empty map.
  """
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  @doc """
    create a game
  """
  def create_game(code) do
    game = generate_new_game(code)
    Agent.update(__MODULE__, &Map.put_new(&1, game.id, game))
    game
  end

  @doc """
    update game to a game
  """
  def update_game(game) do
    Agent.update(__MODULE__, &Map.put(&1, game.id, game))
    game
  end

  @doc """
    Retrieve a game from the map
  """
  def get_game(code) do
    Agent.get(__MODULE__, &Map.get(&1, code))
  end

  @doc """
    Get all the games in the map
  """
  def games do
    Agent.get(__MODULE__, & &1)
  end

  # Game logic
  defp generate_new_game(code) do
    %{
      :id => code,
      :player1 => %{:email => "", :score => 0},
      :player2 => %{:email => "", :score => 0}
    }
  end
end
