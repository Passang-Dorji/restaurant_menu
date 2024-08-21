defmodule RestaurantMenu.Prices.Price do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "prices" do
    field :price, :decimal
    belongs_to :dish, RestaurantMenu.Dishes.Dish
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(price, attrs) do
    price
    |> cast(attrs, [:price, :dish_id])
    |> validate_required([:price, :dish_id])
  end

  defimpl Jason.Encoder, for: Decimal do
    def encode(value, opts) do
      Jason.Encode.string(Decimal.to_string(value), opts)
    end
  end
end
