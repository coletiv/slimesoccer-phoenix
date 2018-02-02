defmodule SuperSlimeGameWeb.Router do
  use SuperSlimeGameWeb, :router
  
  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", SuperSlimeGameWeb do
    pipe_through(:api)

    # Build information
    get("/info", InfoController, :info)
  end
end
