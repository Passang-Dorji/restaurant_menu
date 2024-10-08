defmodule RestaurantMenu.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :address, :string

      timestamps(type: :utc_datetime)
    end
  end
end
