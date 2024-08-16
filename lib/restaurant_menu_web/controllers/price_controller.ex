defmodule RestaurantMenuWeb.PriceController do
  use RestaurantMenuWeb, :controller

  alias RestaurantMenu.Prices
  alias RestaurantMenu.Prices.Price

  action_fallback RestaurantMenuWeb.FallbackController

  def index(conn, _params) do
    prices = Prices.list_prices()
    render(conn, :index, prices: prices)
  end

  def create(conn, %{"price" => price_params}) do
    with {:ok, %Price{} = price} <- Prices.create_price(price_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/prices/#{price}")
      |> render(:show, price: price)
    end
  end

  def show(conn, %{"id" => id}) do
    price = Prices.get_price!(id)
    render(conn, :show, price: price)
  end

  def update(conn, %{"id" => id, "price" => price_params}) do
    price = Prices.get_price!(id)

    with {:ok, %Price{} = price} <- Prices.update_price(price, price_params) do
      render(conn, :show, price: price)
    end
  end

  def delete(conn, %{"id" => id}) do
    price = Prices.get_price!(id)

    with {:ok, %Price{}} <- Prices.delete_price(price) do
      send_resp(conn, :no_content, "")
    end
  end
end
