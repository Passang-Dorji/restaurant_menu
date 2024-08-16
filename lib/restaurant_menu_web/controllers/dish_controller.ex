defmodule RestaurantMenuWeb.DishController do
  use RestaurantMenuWeb, :controller

  alias RestaurantMenu.Dishes
  alias RestaurantMenu.Dishes.Dish

  action_fallback RestaurantMenuWeb.FallbackController

  def index(conn, %{"restaurant_id" => restaurant_id}) do
    dishes = Dishes.get_dish_by_restaurant_id(restaurant_id)
    render(conn, :index, dishes: dishes)
  end
  # def index(conn, _params) do
  #   dishes = Dishes.list_dishes()
  #   render(conn, :index, dishes: dishes)
  # end

  # def index(conn, %{"restaurant_id" => restaurant_id}) do
  #   dishes = Dishes. get_dish_by_restaurant_id(restaurant_id)
  #   json(conn, dishes)
  # end

  def create(conn, %{"dish" => dish_params}) do
    with {:ok, %Dish{} = dish} <- Dishes.create_dish(dish_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/dishes/#{dish}")
      |> render(:show, dish: dish)
    end
  end

  def show(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)
    render(conn, :show, dish: dish)
  end


  def update(conn, %{"id" => id, "dish" => dish_params}) do
    dish = Dishes.get_dish!(id)

    with {:ok, %Dish{} = dish} <- Dishes.update_dish(dish, dish_params) do
      render(conn, :show, dish: dish)
    end
  end

  def delete(conn, %{"id" => id}) do
    dish = Dishes.get_dish!(id)

    with {:ok, %Dish{}} <- Dishes.delete_dish(dish) do
      send_resp(conn, :no_content, "")
    end
  end
end
