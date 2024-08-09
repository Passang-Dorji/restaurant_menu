defmodule RestaurantMenu.Repo.Migrations.CreateDishes do
  use Ecto.Migration

  def change do
    create table(:dishes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string
      add :restaurant_id, references(:restaurants, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:dishes, [:restaurant_id])
  end
end
