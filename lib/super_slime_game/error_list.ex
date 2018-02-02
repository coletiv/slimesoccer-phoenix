defmodule SuperSlimeGame.Error do
  alias SuperSlimeGameWeb.ErrorView

  import Phoenix.Controller, only: [render: 4]
  import Plug.Conn, only: [put_status: 2, halt: 1]

  alias SuperSlimeGameWeb.GenericView

  @moduledoc """
  List of all possible errors from API
  """
  def get(error) when is_atom(error) do
    case error do
      :internal_error       -> %{id: 1, message: "Internal error"}
      :resource_not_found   -> %{id: 2, message: "Resource not found"}
      :rate_limit_exceeded  -> %{id: 3, message: "Rate limit exceeded"}
      :invalid_credentials  -> %{id: 11, message: "Invalid credentials"}
      :invalid_login_type   -> %{id: 12, message: "Invalid login type"}
      :user_not_allowed     -> %{id: 13, message: "User not allowed"}
      :not_authenticated    -> %{id: 14, message: "Not authenticated"}
      :not_authorized       -> %{id: 15, message: "Not authorized"}
      :not_activated        -> %{id: 16, message: "Not activated"}
      :user_not_found       -> %{id: 17, message: "User not found"}
      :payment_denied       -> %{id: 50, message: "Payment denied"}
      :invalid_food_item    -> %{id: 60, message: "Invalid food selected"}
      :invalid_food_extra    -> %{id: 61, message: "Invalid food extra selected"}
      :invalid_food_option    -> %{id: 62, message: "Invalid food option selected"}
      :invalid_delivery_time  -> %{id: 63, message: "Invalid delivery time"}
      :invalid_cancel_reason  -> %{id: 64, message: "Invalid cancel reason"}
      :invalid_food_set       -> %{id: 65, message: "Invalid food set"}
      :minimum_order_price_required -> %{id: 66, message: "Minimum order price is required"}
      :unmatch_price          -> %{id: 67, message: "Client price doesn't match server price"}
      :invalid_status_update  -> %{id: 70, message: "Invalid order status"}

      _ -> %{id: 1, message: "Internal error"}
    end
  end

  def render(conn, error) when is_atom(error) do
     conn
     |> render(ErrorView, "error.json", get(error))
  end

  def handle_not_found(conn) do
    conn
    |> put_status(:not_found)
    |> render(ErrorView, "error.json", get(:resource_not_found))
    |> halt
  end

  def handle_bad_request(conn) do
    conn
    |> put_status(:bad_request)
    |> render(GenericView, "empty.json", %{})
    |> halt
  end

  def handle_unauthorized(conn) do
    conn
    |> put_status(:unauthorized)
    |> render(:not_authorized)
    |> halt
  end

end
