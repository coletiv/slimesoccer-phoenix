defmodule Slimesoccer.PageController do
  use Slimesoccer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
