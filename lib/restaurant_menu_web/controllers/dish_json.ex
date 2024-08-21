defmodule RestaurantMenuWeb.DishJSON do
  alias RestaurantMenu.Dishes.Dish
  @doc """
  Renders a list of dishes.
  """
  def index(%{dishes: dishes}) do
    %{data: for(dish <- dishes, do: data(dish))}
  end

  @doc """
  Renders a single dish.
  """
  def show(%{dish: dish}) do
    %{data: data(dish)}
  end

  defp data(%Dish{} = dish) do
    %{
      id: dish.id,
      name: dish.name,
      description: dish.description,
      restaurant_id: dish.restaurant_id,
      prices: Enum.map(dish.prices, &price_data/1)
    }
  end
  defp price_data(%RestaurantMenu.Prices.Price{} = price) do
    %{
      amount: Decimal.to_string(price.price),
    }
  end
end
