defmodule RestaurantMenu.RestaurantsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RestaurantMenu.Restaurants` context.
  """

  @doc """
  Generate a restaurant.
  """
  def restaurant_fixture(attrs \\ %{}) do
    {:ok, restaurant} =
      attrs
      |> Enum.into(%{
        address: "some address",
        name: "some name"
      })
      |> RestaurantMenu.Restaurants.create_restaurant()

    restaurant
  end
end
