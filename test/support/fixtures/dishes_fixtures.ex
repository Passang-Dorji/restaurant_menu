defmodule RestaurantMenu.DishesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RestaurantMenu.Dishes` context.
  """

  @doc """
  Generate a dish.
  """
  def dish_fixture(attrs \\ %{}) do
    {:ok, dish} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> RestaurantMenu.Dishes.create_dish()

    dish
  end
end
