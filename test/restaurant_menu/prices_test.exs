defmodule RestaurantMenu.PricesTest do
  use RestaurantMenu.DataCase

  alias RestaurantMenu.Prices

  describe "prices" do
    alias RestaurantMenu.Prices.Price

    import RestaurantMenu.PricesFixtures

    @invalid_attrs %{price: nil}

    test "list_prices/0 returns all prices" do
      price = price_fixture()
      assert Prices.list_prices() == [price]
    end

    test "get_price!/1 returns the price with given id" do
      price = price_fixture()
      assert Prices.get_price!(price.id) == price
    end

    test "create_price/1 with valid data creates a price" do
      valid_attrs = %{price: "120.5"}

      assert {:ok, %Price{} = price} = Prices.create_price(valid_attrs)
      assert price.price == Decimal.new("120.5")
    end

    test "create_price/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prices.create_price(@invalid_attrs)
    end

    test "update_price/2 with valid data updates the price" do
      price = price_fixture()
      update_attrs = %{price: "456.7"}

      assert {:ok, %Price{} = price} = Prices.update_price(price, update_attrs)
      assert price.price == Decimal.new("456.7")
    end

    test "update_price/2 with invalid data returns error changeset" do
      price = price_fixture()
      assert {:error, %Ecto.Changeset{}} = Prices.update_price(price, @invalid_attrs)
      assert price == Prices.get_price!(price.id)
    end

    test "delete_price/1 deletes the price" do
      price = price_fixture()
      assert {:ok, %Price{}} = Prices.delete_price(price)
      assert_raise Ecto.NoResultsError, fn -> Prices.get_price!(price.id) end
    end

    test "change_price/1 returns a price changeset" do
      price = price_fixture()
      assert %Ecto.Changeset{} = Prices.change_price(price)
    end
  end
end
