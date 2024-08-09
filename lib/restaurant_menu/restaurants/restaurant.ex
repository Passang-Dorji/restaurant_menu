defmodule RestaurantMenu.Restaurants.Restaurant do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "restaurants" do
    field :name, :string
    field :address, :string
    has_many :dishes, RestaurantMenu.Dishes.Dish
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(restaurant, attrs) do
    restaurant
    |> cast(attrs, [:name, :address])
    |> validate_required([:name, :address])
  end
end
