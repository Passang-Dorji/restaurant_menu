defmodule RestaurantMenu.Repo do
  use Ecto.Repo,
    otp_app: :restaurant_menu,
    adapter: Ecto.Adapters.Postgres
end
