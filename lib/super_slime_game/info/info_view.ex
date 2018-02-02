defmodule SuperSlimeGameWeb.InfoView do
  use SuperSlimeGameWeb, :view

  def render("info.json", %{version: version}) do
    %{
      version: version
    }
  end
end
