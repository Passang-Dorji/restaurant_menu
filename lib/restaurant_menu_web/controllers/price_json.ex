defmodule RestaurantMenuWeb.PriceJSON do
  alias RestaurantMenu.Prices.Price

  @doc """
  Renders a list of prices.
  """
  def index(%{prices: prices}) do
    %{data: for(price <- prices, do: data(price))}
  end

  @doc """
  Renders a single price.
  """
  def show(%{price: price}) do
    %{data: data(price)}
  end

  defp data(%Price{} = price) do
    %{
      id: price.id,
      price: price.price,
      dish_id: price.dish_id
    }
  end
end
