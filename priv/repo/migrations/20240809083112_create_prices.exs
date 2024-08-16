defmodule RestaurantMenu.Repo.Migrations.CreatePrices do
  use Ecto.Migration

  def change do
    create table(:prices, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :price, :decimal
      add :dish_id, references(:dishes, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:prices, [:dish_id])
  end
end
