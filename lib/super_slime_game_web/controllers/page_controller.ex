defmodule SuperSlimeGameWeb.PageController do
  use SuperSlimeGameWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
