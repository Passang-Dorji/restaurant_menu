defmodule RestaurantMenu.Dishes.Dish do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "dishes" do
    field :name, :string
    field :description, :string
    belongs_to :restaurant, RestaurantMenu.Restaurants.Restaurant
    has_many :prices, RestaurantMenu.Prices.Price
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(dish, attrs) do
    dish
    |> cast(attrs, [:name, :description, :restaurant_id])
    |> validate_required([:name, :description, :restaurant_id])
    # |> assoc_constraint(:prices)
  end
end
