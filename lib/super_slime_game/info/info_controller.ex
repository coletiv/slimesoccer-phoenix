defmodule SuperSlimeGameWeb.InfoController do
  use SuperSlimeGameWeb, :controller

  def info(conn, _params) do
    {:ok, vsn} = :application.get_key(:super_slime_game, :vsn)
    render conn, "info.json", %{version: List.to_string(vsn)}
  end
end
