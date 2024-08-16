defmodule RestaurantMenu.PricesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RestaurantMenu.Prices` context.
  """

  @doc """
  Generate a price.
  """
  def price_fixture(attrs \\ %{}) do
    {:ok, price} =
      attrs
      |> Enum.into(%{
        price: "120.5"
      })
      |> RestaurantMenu.Prices.create_price()

    price
  end
end
